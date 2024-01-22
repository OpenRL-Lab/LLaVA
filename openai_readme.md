## OpenAI OpenAI-Compatible APIs
The following OpenAI-Compatible APIs are implemented mostly based on [FastChat openai_api_server](https://github.com/lm-sys/FastChat/blob/main/docs/openai_api.md)

It supported:
- Vision Chat Completions. (Reference: https://platform.openai.com/docs/guides/vision)

Launch the RESTful API server:
```bash
./controller.sh
./worker.sh
./run.sh
```

Usage with OpenAI Python SDK:

The goal of `openai_api_server.py` is to implement a fully OpenAI-compatible API server, so the models can be used directly with [openai-python](https://github.com/openai/openai-python) library.

First, install openai-python:
```bash
pip install --upgrade openai
```

Then, interact with model vicuna:
```python
from openai import OpenAI

api_key = ""

# Controller endpoint
base_url = "http://localhost:8000/api/v1"


client = OpenAI(
    api_key=api_key,
    base_url=base_url
)

response = client.chat.completions.create(
  model="llava-v1.5-7b",
  messages=[
    {
      "role": "user",
      "content": [
        {"type": "text", "text": "What’s in this image?"},
        {
          "type": "image_url",
          "image_url": {
            "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Gfp-wisconsin-madison-the-nature-boardwalk.jpg/2560px-Gfp-wisconsin-madison-the-nature-boardwalk.jpg",
          },
        },
      ],
    }
  ],
  max_tokens=300,
  stream=False
)

print(response.choices[0])
```
