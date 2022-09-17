package com.dengzh.flutter_demo

import android.content.Context
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

/**
 * @author Dengzh
 * @date 2022/9/15
 * Description:
 * 1.实现FlutterPlugin、MethodCallHandler。
 * 2.注册到 GeneratedPluginRegistrant
 */
public class MyFlutterPlugin:FlutterPlugin,MethodChannel.MethodCallHandler {

    private var channel : MethodChannel? = null

    companion object {
        @JvmStatic
        fun registerWith(registrar: PluginRegistry.Registrar) {
            val plugin = MyFlutterPlugin()
            plugin.setupChannel(registrar.messenger(), registrar.context())
        }
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        setupChannel(binding.binaryMessenger, binding.applicationContext)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        teardownChannel()
    }

    /**
     * 供Flutter调用的native方法。
     * */
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method.equals("getPlatformVersion")){
            result.success("Android " + android.os.Build.VERSION.RELEASE)
        }else{
            result.notImplemented()
        }
    }

    private fun setupChannel(messenger: BinaryMessenger, context: Context) {
        channel = MethodChannel(messenger,"dzh/my_flutter_plugin")
        channel?.setMethodCallHandler(this)
    }

    private fun teardownChannel() {
        channel?.setMethodCallHandler(null)
        channel = null
    }
}