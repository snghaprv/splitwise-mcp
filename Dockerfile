CMD supergateway --stdio "python -m splitwise_mcp_server" \
    --outputTransport streamableHttp --port $PORT \
    --streamableHttpPath "/${MCP_SECRET}/mcp" \
    --stateful --sessionTimeout 600000
