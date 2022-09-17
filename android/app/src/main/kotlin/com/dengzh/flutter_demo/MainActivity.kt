package com.dengzh.flutter_demo;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugins.GeneratedPluginRegistrant

public class MainActivity: FlutterActivity() {

    /**
     * Flutter与Android原生进行交互
     * https://www.jianshu.com/p/f483a1fa533c
     * */

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

       // GeneratedPluginRegistrant.registerWith()
       // flutterEngine.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
        flutterEngine.plugins.add(MyFlutterPlugin())
    }
}
