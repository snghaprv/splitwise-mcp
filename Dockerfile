FROM python:3.12-slim
RUN apt-get update && apt-get install -y --no-install-recommends nodejs npm \
    && rm -rf /var/lib/apt/lists/* && npm i -g supergateway
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -e .
ENV PORT=8080
CMD supergateway --stdio "python -m splitwise_mcp_server" \
    --outputTransport streamableHttp --port $PORT \
    --streamableHttpPath "/${MCP_SECRET}/mcp" \
    --stateful --sessionTimeout 600000
