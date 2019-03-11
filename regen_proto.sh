#!/bin/bash

export PATH=$PATH:$HOME/.pub-cache/bin
exec protoc --dart_out=grpc:lib/src/generated -Iproto proto/audioStream.proto

