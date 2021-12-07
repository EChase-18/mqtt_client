/*
 * Package : mqtt_client
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 22/06/2017
 * Copyright :  S.Hamblett
 */

part of mqtt_browser_client;

///  This class provides specific connection functionality
///  for browser based connection handler implementations.
abstract class MqttBrowserConnectionHandler extends MqttConnectionHandlerBase {
  /// Initializes a new instance of the [MqttBrowserConnectionHandler] class.
  MqttBrowserConnectionHandler(var clientEventBus, {required int maxConnectionAttempts})
      : super(clientEventBus, maxConnectionAttempts: maxConnectionAttempts);

  /// Use a websocket rather than TCP
  bool useWebSocket = false;

  /// Alternate websocket implementation.
  ///
  /// The Amazon Web Services (AWS) IOT MQTT interface(and maybe others)
  /// has a bug that causes it not to connect if unexpected message headers are
  /// present in the initial GET message during the handshake.
  /// Since the httpclient classes insist on adding those headers, an alternate
  /// method is used to perform the handshake.
  /// After the handshake everything goes back to the normal websocket class.
  /// Only use this websocket implementation if you know it is needed
  /// by your broker.
  bool useAlternateWebSocketImplementation = false;

  /// If set use a secure connection, note TCP only, not websocket.
  bool secure = false;
}
