package com.vivasoft.pi_tracker_client;

import static android.content.Context.BIND_AUTO_CREATE;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.vivasoft.pi_tracker_client.services.AutoResultDispatcher;
import com.vivasoft.pitrackercommons.constants.RequestCodes;
import com.vivasoft.pitrackercommons.constants.ResponseCodes;
import com.vivasoft.pitrackercommons.handlers.IncomingMessageHandler;
import com.vivasoft.pitrackercommons.models.StateBase;
import com.vivasoft.pitrackercommons.utils.IPCDataHelper;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class PiTrackerClientPlugin implements FlutterPlugin, MethodCallHandler {
  private Context context;
  private Messenger sender;
  private Messenger receiver;
  private ServiceConnection serviceConnection;

  private MethodChannel channel;

  // return refs
  private final AutoResultDispatcher getMyConfigResult = new AutoResultDispatcher(2000);
  private final AutoResultDispatcher setMyConfigResult = new AutoResultDispatcher(2000);
  private final AutoResultDispatcher requestOpenPermissionManagerActivityResult = new AutoResultDispatcher(2000);

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    context = flutterPluginBinding.getApplicationContext();
    channel = new MethodChannel(
      flutterPluginBinding.getBinaryMessenger(),
      "pi_tracker_client"
    );

    // set this class as method call handler
    channel.setMethodCallHandler(this);

    // on attach, setup connection with remote service
    initConnection();
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    // prevent this class from listening to channel calls
    channel.setMethodCallHandler(null);

    // on detach, remove connection from remote service
    removeConnection();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("trackerServiceExists")) {
      result.success(trackerExists());
    } else if (call.method.equals("getMyConfig")) {
      if (connected()) sendRequest(RequestCodes.RETURN_MY_CONFIG, null);
      getMyConfigResult.scheduleSendAutoResult(
        new StateBase(
          context.getPackageName(),
          ResponseCodes.RETURNING_YOUR_CONFIG,
          false,
          "Timeout"
        ),
        result
      );
    } else if (call.method.equals("setMyConfig")) {
      if (connected()) sendRequest(RequestCodes.CREATE_MY_CONFIG, call.argument("config"));
      setMyConfigResult.scheduleSendAutoResult(
        new StateBase(
          context.getPackageName(),
          ResponseCodes.CREATED_YOUR_CONFIG,
          false,
          "Timeout"
        ),
        result
      );
    } else if (call.method.equals("requestOpenPermissionManagerActivity")) {
      if (connected()) sendRequest(RequestCodes.OPEN_PERMISSION_MANAGER_ACTIVITY, null);
      requestOpenPermissionManagerActivityResult.scheduleSendAutoResult(
        new StateBase(
          context.getPackageName(),
          ResponseCodes.OPENED_PERMISSION_MANAGER_ACTIVITY,
          false,
          "Timeout"
        ),
        result
      );
    } else {
      result.notImplemented();
    }
  }

  private void initConnection() {
    serviceConnection = new ServiceConnection() {
      @Override
      public void onServiceConnected(ComponentName name, IBinder service) {
        sender = new Messenger(service);
      }

      @Override
      public void onServiceDisconnected(ComponentName name) {
        sender = null;
      }
    };

    Looper myLooper = Looper.myLooper();
    assert myLooper != null;
    receiver = new Messenger(
      new IncomingMessageHandler(
        myLooper,
        this::handleResponseCases
      )
    );

    context.bindService(
      new Intent("com.vivasoft.pitracker.trackerservice")
        .setPackage("com.vivasoft.pitracker"),
      serviceConnection,
      BIND_AUTO_CREATE
    );
  }

  private void removeConnection() {
    serviceConnection = null;
    receiver = null;
    sender = null;
  }

  private void handleResponseCases(@NonNull Message message) {
    switch (message.what) {
      case ResponseCodes.RETURNING_YOUR_CONFIG: {
        sendResultToChannel(
          ResponseCodes.RETURNING_YOUR_CONFIG,
          IPCDataHelper.getDataFor(message),
          getMyConfigResult
        );
        break;
      }
      case ResponseCodes.CREATED_YOUR_CONFIG: {
        sendResultToChannel(
          ResponseCodes.CREATED_YOUR_CONFIG,
          IPCDataHelper.getDataFor(message),
          setMyConfigResult
        );
        break;
      }
      case ResponseCodes.PERMISSIONS_NOT_GRANTED: {
        sendResultToChannel(
          ResponseCodes.PERMISSIONS_NOT_GRANTED,
          IPCDataHelper.getDataFor(message),
          setMyConfigResult
        );
        break;
      }
      default: {
        break;
      }
    }
  }

  private void sendRequest(int code, @Nullable String data) {
    try {
      Message message = Message.obtain(null, code);
      message.setData(
        IPCDataHelper.getBundleFor(
          new StateBase(
            context.getPackageName(),
            code,
            true,
            data
          )
        )
      );
      message.replyTo = receiver;

      sender.send(message);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  private void sendResultToChannel(
    int code,
    @Nullable StateBase data,
    @NonNull AutoResultDispatcher dispatcher
  ) {
    if (data != null) {
      dispatcher.sendResult(data);
    } else {
      dispatcher.sendResult(
        new StateBase(
          context.getPackageName(),
          code,
          false,
          null
        )
      );
    }
  }

  private boolean connected() {
    return sender != null && receiver != null && serviceConnection != null;
  }

  private boolean trackerExists() {
    PackageManager packageManager = context.getPackageManager();

    PackageInfo packageInfo = null;
    try {
      packageInfo = packageManager.getPackageInfo("com.vivasoft.pitracker", 0);
    } catch (PackageManager.NameNotFoundException e) {
      e.printStackTrace();
    }

    return packageInfo != null;
  }
}
