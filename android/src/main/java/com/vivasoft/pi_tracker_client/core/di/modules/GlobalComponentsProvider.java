package com.vivasoft.pi_tracker_client.core.di.modules;

import android.content.Context;
import android.content.SharedPreferences;

import androidx.annotation.NonNull;

import com.google.gson.Gson;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import dagger.hilt.InstallIn;
import dagger.hilt.android.qualifiers.ApplicationContext;
import dagger.hilt.components.SingletonComponent;

@Module
@InstallIn(SingletonComponent.class)
public class GlobalComponentsProvider {
  @Provides
  @Singleton
  public SharedPreferences getGlobalPreferences(@NonNull @ApplicationContext Context appContext) {
    return appContext.getSharedPreferences("pi_tracker_preferences", Context.MODE_PRIVATE);
  }

  @Provides
  @Singleton
  public SharedPreferences.Editor getGlobalPreferenceEditor(@NonNull @ApplicationContext Context appContext) {
    return getGlobalPreferences(appContext).edit();
  }

  @Provides
  @Singleton
  public Gson getDefaultJsonParser() {
    return new Gson();
  }
}
