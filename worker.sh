#!/bin/bash


python -m llava.serve.model_worker --host 0.0.0.0 --controller http://localhost:65235 --port 65236 --worker http://localhost:65236 --model-path liuhaotian/llava-v1.5-13b
