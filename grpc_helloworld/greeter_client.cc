/*
 *
 * Copyright 2015 gRPC authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

#include <iostream>
#include <memory>
#include <string>

#include <grpcpp/grpcpp.h>

#ifdef BAZEL_BUILD
#include "examples/protos/helloworld.grpc.pb.h"
#else
#include "helloworld.grpc.pb.h"
#endif

using grpc::Channel;
using grpc::ClientContext;
using grpc::ClientWriter;
using grpc::Status;
using helloworld::HelloRequest;
using helloworld::HelloReply;
using helloworld::Greeter;

class GreeterClient {
 public:
  GreeterClient(std::shared_ptr<Channel> channel)
      : stub_(Greeter::NewStub(channel)) {}

  // Assembles the client's payload, sends it and presents the response back
  // from the server.
  std::string SayHello(const std::string& user, int num_outer_loops, int num_requests) {
    HelloRequest request;
    request.set_name(user);

    HelloReply reply;

    std::string last_reply;
    for(int i = 0; i < num_outer_loops; i++) {
      ClientContext context;
      std::unique_ptr<ClientWriter<HelloRequest> > writer(
        stub_->SayHello(&context, &reply));

      for(int j = 0; j < num_requests; j++) {
        if(!writer->Write(request)) {
          std::cerr << "Broken stream" << std::endl;
          break;
        }
      }

      writer->WritesDone();
      Status status = writer->Finish();
      if(status.ok()) {
        last_reply = reply.message();
      } else {
        std::cerr << status.error_code() << ": " << status.error_message()
                  << std::endl;
      }
    }

    return last_reply;
  }

 private:
  std::unique_ptr<Greeter::Stub> stub_;
};

int main(int argc, char** argv) {
  GreeterClient greeter(grpc::CreateChannel(
      "localhost:50051", grpc::InsecureChannelCredentials()));
  std::string user("world");
  std::string reply = greeter.SayHello(user, 10000, 10);
  std::cout << "Greeter received: " << reply << std::endl;

  return 0;
}
