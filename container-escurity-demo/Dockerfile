 # Intentionally insecure Dockerfile for container security demo
 
 # 古いベースイメージ（脆弱性あり）
 FROM python:3.8-slim
 
 # rootユーザーのまま実行（脆弱）
 # USER命令なし
 
 # シークレットをイメージに含める（脆弱）
 ENV DB_PASSWORD="SuperSecret123!"
 ENV API_KEY="sk-test-insecure-key-12345"
 
 # 不要なパッケージインストール + キャッシュ未削除
 RUN apt-get update && apt-get install -y \
     curl \
     wget \
     netcat-openbsd \
     telnet
 
 # アプリコードをコピー
 COPY . /app
 WORKDIR /app
 
 # 全ポート公開（脆弱）
 EXPOSE 0-65535
 
 # rootで実行
 CMD ["python", "app.py"]
