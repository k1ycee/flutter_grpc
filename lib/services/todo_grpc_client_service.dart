import 'package:flutter_grpc/grpc_files/proto/todo.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class TodoService {

  /// Ngrok url will look like this `tcp://2.tcp.eu.ngrok.io:10944`
  /// Your baseurl is `2.tcp.eu.ngrok.io`
  /// Your port is `10944`
  /// If you're wondering if you don't need `tcp://`, you're absolutely right it won't affect you code in any way.
  String baseUrl = "2.tcp.eu.ngrok.io";

  TodoService._internal();

  static final TodoService _instance = TodoService._internal();

  factory TodoService() => _instance;

  ///static TodoService instance that we will call when we want to make requests
  static TodoService get instance => _instance;
  /* TodoServiceClient is the  class that was generated for us when we ran the generation command */
  ///We will pass a channel to it to intialize it
  late TodoServiceClient _todoServiceClient;

  ///this will be used to create a channel once we create this class.
  ///Call TodoService().init() before making any call.
  Future<void> init() async {
    _createChannel();
  }

  ///provide public access to the TodoServiceClient instance
  TodoServiceClient get todoServiceClient {
    return _todoServiceClient;
  }

  ///here we create a channel and use it to initialize the TodoServiceClient that was generated
  ///
  _createChannel() {
    final channel = ClientChannel(
      baseUrl,
      port: 10944,

      ///use credentials: ChannelCredentials.insecure() if you want to connect without TLS
      //options: const ChannelOptions(credentials: ChannelCredentials.insecure()),

      ///use this if you are connecting with TLS
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    _todoServiceClient = TodoServiceClient(channel);
  }
}
