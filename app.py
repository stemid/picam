from pprint import pprint
from os import listdir
from fname import fname

# Until pyvenv-3.4 is fixed on centos 7 support python 2.
try:
    from configparser import RawConfigParser
except ImportError:
    from ConfigParser import RawConfigParser

#from logging import Formatter, getLogger, DEBUG, INFO, WARN
#from logging.handlers import SysLogHandler, RotatingFileHandler

from bottle import default_app, route, run
from bottle import request, response, template, static_file

config = RawConfigParser()
config.readfp(open('./picam_app.cfg'))
#config.read(['/et.cfg', './picam_app.local.cfg'])


def get_video_list(video_dir):
    videos = []
    for filename in listdir(video_dir):
        if fname(filename, '*.avi'):
            videos.append({
                'filename': filename,
            })
    return videos


@route('/static/<path:path>')
def server_static(path):
    return static_file(path, root=config.get('picam', 'static_dir'))


@route('/')
def picam_index():
    video_list = get_video_list(config.get('picam', 'video_dir'))
    picam_data = {
        'stream_url': config.get('picam', 'stream_url'),
        'control_url': config.get('picam', 'control_url')
    }
    return template(
        'index',
        picam_config=picam_data,
        videos=videos
    )


if __name__ == '__main__':
    run(
        host=config.get('picam', 'listen_host'),
        port=config.getint('picam', 'listen_port')
    )
    debug(config.getbool('picam', 'debug'))
else:
    application = default_app
