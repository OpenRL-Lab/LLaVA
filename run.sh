#!/bin/bash


python -m llava.serve.openai_api_server --host 0.0.0.0 --port 65237 --controller-address http://localhost:65235
