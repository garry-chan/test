// chirps/INIT.js
Modernizr.load(
  {
    test: (!!window.XDomainRequest)
      || ( (!!window.XMLHttpRequest) && ('withCredentials' in (new XMLHttpRequest)) ),
    yep:
      [
        'chirps-to-html5.js',
        'chirps-from-cors.js'
      ],
    nope: 'chirps-referral.js'
  } );
