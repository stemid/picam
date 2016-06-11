<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <title>Raspberry Pi Camera</title>
  <meta name="description" content="Picam">
  <meta name="author" content="Stefan Midjich">

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link href="//fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">

  <link rel="stylesheet" href="/static/css/normalize.css">
  <link rel="stylesheet" href="/static/css/skeleton.css">
  <link rel="stylesheet" href="/static/css/picam.css">

</head>
<body>

  <div class="container">
    <noscript>
      <div class="row" style="margin-top: 1%">
        <div class="six columns msgbox msgbox-error" style="margin-top: 2%;">
          <p>Denna sidan kräver Javascript, du måste aktivera Javascript i din webbläsare för att fortsätta.</p>
        </div>
      </div>
    </noscript>

    <div class="row" style="margin-top: 10%">
      <div class="two-thirds column">
        <h4>Raspberry Pi Camera</h4>
        <img src="{{picam_config['stream_url']}}" id="raspi-camera" alt="Raspberry Pi Camera image" width="640" height="480" />

      </div>

      <div class="one-third column">
        <ul>
          <li><a href="{{picam_config['control_url']}}" title="Control page">Control</a></li>
          <li><a href="{{picam_config['control_url']}}0/action/snapshot" title="Snapshot">Snapshot</a></li>
          <li><a href="{{picam_config['control_url']}}0/action/restart" title="Restart motion service">Restart</a></li>
        </ul>
      </div>
    </div>

    {% if videos | length > 0 %}
    <div class="row" style="margin-top:1%">
    </div>
    {% endif %}

  </div>

  <script src="https://code.jquery.com/jquery-1.12.2.min.js"></script>
  <script src="/static/js/picam.js"></script>

</body>
</html>

