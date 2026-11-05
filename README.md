# xray-ws-node

Xray VLESS + WebSocket 节点容器。平台（Render / Zeabur / Railway 等）在 443 做 TLS 终结，
容器内 Xray 监听平台分配的 `$PORT` 跑 WS。

## 需要的环境变量

| 变量 | 说明 |
|---|---|
| `UUID` | VLESS 客户端 UUID |
| `WS_PATH` | WebSocket 路径，如 `/ws-xxxx` |

`$PORT` 由平台自动注入，无需设置。
