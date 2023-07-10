package com.vivasoft.pi_tracker_client.services;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.google.gson.Gson;
import com.vivasoft.pi_tracker_client.annotations.LateInit;
import com.vivasoft.pitrackercommons.models.StateBase;

import io.flutter.plugin.common.MethodChannel;

public class AutoResultDispatcher {
  private final long timeout;

  @LateInit
  private MethodChannel.Result result;


  private final Gson parser = new Gson();
  private final Boolean[] consumed = {false};

  public AutoResultDispatcher(long timeout) {
    this.timeout = timeout;
  }

  /**
   * This should be called immediately after you receive a call from method channel.
   * */
  public void scheduleSendAutoResult(@NonNull StateBase data, @NonNull MethodChannel.Result result) {
    // first set out result channel
    this.result = result;
    this.consumed[0] = false;

    new Thread(() -> {
      try {
        Thread.sleep(timeout);
      } catch (InterruptedException e) {
        throw new RuntimeException(e);
      }

      synchronized (consumed[0]) {
        if (!consumed[0]) {
          sendResult(data);
        }
      }
    }).start();
  }

  /**
   * Call this method if you want to send result before timeout.
   * If this is called, the
   * */
  public void sendResult(@NonNull StateBase data) {
    if(result == null) throw new RuntimeException("Result not initialized");
    consumed[0] = true;
    result.success(parser.toJson(data));
  }
}
