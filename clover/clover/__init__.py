from flask import Flask
from flask_cors import CORS
from werkzeug.utils import import_string

from clover import config
from clover.exts import db, client
from clover.urls import map_urls


blueprints = [
    'clover.suite:suite',
    'clover.interface:interface',
    'clover.environment:environment',
]


def create_app():
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_object(config)

    app.app_context().push()
    map_urls(app)
    db.init_app(app)

    for bp_name in blueprints:
        bp = import_string(bp_name)
        app.register_blueprint(bp)

    CORS(app, supports_credentials=True)

    return app


app = create_app()
