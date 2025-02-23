from http.server import HTTPServer, BaseHTTPRequestHandler
from datetime import datetime
import json

class AlertHandler(BaseHTTPRequestHandler):
    def do_POST(self):
        print("\n=== Nova conexão POST recebida ===")
        print(f"De: {self.client_address[0]}:{self.client_address[1]}")
        print("Headers:")
        for header, value in self.headers.items():
            print(f"  {header}: {value}")
        
        # Lê o conteúdo do POST
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length)
        
        print("\nConteúdo recebido:")
        print(post_data.decode())
        print("===========================\n")
        
        # Log no console
        print(f"[{datetime.now()}] Alerta recebido: {post_data.decode()}")
        
        # Salva no arquivo de log
        with open("alerts.log", "a") as f:
            f.write(f"[{datetime.now()}] {post_data.decode()}\n")
        
        # Envia resposta
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        self.wfile.write(b"OK")

    def do_GET(self):
        print(f"\n=== Nova conexão GET recebida de {self.client_address[0]}:{self.client_address[1]} ===")
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        self.wfile.write(b"Alert Server Running")

def run_server():
    server_address = ('0.0.0.0', 8080)  # Escuta em todas as interfaces
    httpd = HTTPServer(server_address, AlertHandler)
    print("\nServidor iniciado na porta 8080 (escutando em todas as interfaces)...")
    print(f"Endereço local: http://localhost:8080")
    print(f"Para testar, use: curl -X POST -d 'teste' http://localhost:8080")
    print("Aguardando conexões...\n")
    httpd.serve_forever()

if __name__ == '__main__':
    run_server()
