package com.example.mes_mobile_client;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
//    StrictMode.VmPolicy.Builder builder = new StrictMode.VmPolicy.Builder();
//    StrictMode.setVmPolicy(builder.build());
  }
}
