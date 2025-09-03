from waitress import serve
from login_form import create_app

app = create_app()

if __name__ == '__main__':
    # Serve on all interfaces (0.0.0.0) at port 5000
    serve(app, host='0.0.0.0', port=5000, server_name='')