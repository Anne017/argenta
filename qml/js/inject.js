function handler(event) {
    console.log('Injecting ubuntu touch styling fixes');

    var style = document.createElement('style');
    style.type = 'text/css';
    style.appendChild(document.createTextNode(
        '.navbar-toggle { display: none; } '+
        '.col-sm-4 ag-footer-links ng-scope { display: none; } ' +
        '.ag-footer-links-title { display: none; } ' +
        '.bp-container bp-ui-dragRoot argenta-footer-container { display: none; } ' +
        '.ag-navbar-links { display: none; } ' +
        '.alert alert-danger { display: none; } ' +
        '.lp-content-text-area { display: none; } ' +
        '.argenta-notification panel panel-body { display: none; } '
    ));

    document.head.appendChild(style);
}

window.addEventListener('load', handler, false);

