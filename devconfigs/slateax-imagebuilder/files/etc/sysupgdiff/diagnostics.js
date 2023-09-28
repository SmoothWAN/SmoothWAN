'use strict';
'require view';
'require dom';
'require fs';
'require ui';
'require uci';
'require network';

return view.extend({
	handleCommand: function(exec, args) {
		var buttons = document.querySelectorAll('.diag-action > .cbi-button');

		for (var i = 0; i < buttons.length; i++)
			buttons[i].setAttribute('disabled', 'true');

		return fs.exec(exec, args).then(function(res) {
			var out = document.querySelector('.command-output');
			    out.style.display = '';

			dom.content(out, [ res.stdout || '', res.stderr || '' ]);
		}).catch(function(err) {
			ui.addNotification(null, E('p', [ err ]))
		}).finally(function() {
			for (var i = 0; i < buttons.length; i++)
				buttons[i].removeAttribute('disabled');
		});
	},

	handlePing: function(ev, cmd) {
		var exec = cmd || 'ping',
		    addr = ev.currentTarget.parentNode.previousSibling.value,
		    args = (exec == 'ping') ? [ '-4', '-c', '5', '-W', '1', addr ] : [ '-6', '-c', '5', addr ];

		return this.handleCommand(exec, args);
	},

	handleTraceroute: function(ev, cmd) {
		var exec = cmd || 'traceroute',
		    addr = ev.currentTarget.parentNode.previousSibling.value,
		    args = (exec == 'traceroute') ? [ '-4', '-q', '1', '-w', '1', '-n', '-m', String(L.env.rpctimeout || 20), addr ] : [ '-q', '1', '-w', '2', '-n', addr ];

		return this.handleCommand(exec, args);
	},

	handleNslookup: function(ev, cmd) {
		var addr = ev.currentTarget.parentNode.previousSibling.value;

		return this.handleCommand('nslookup', [ addr ]);
	},

	handleArpScan: function(ev, cmd) {
		var addr = ev.currentTarget.parentNode.previousSibling.value;

		return this.handleCommand('arp-scan', [ '-l', '-I', addr ]);
	},

    handleVcgencmd: function(ev, cmd) {
        var commandvc =  ev.currentTarget.parentNode.previousSibling.value;

		return this.handleCommand('vcgencmd', [ commandvc ]);
	},

	handleWanspeedtest: function(ev, cmd) {
		var wanint = ev.currentTarget.parentNode.previousSibling.value;

		return this.handleCommand('wanspeedtest', [ wanint ]);
	},

	load: function() {
		return Promise.all([
			L.resolveDefault(fs.stat('/bin/ping6'), {}),
			L.resolveDefault(fs.stat('/usr/bin/ping6'), {}),
			L.resolveDefault(fs.stat('/bin/traceroute6'), {}),
			L.resolveDefault(fs.stat('/usr/bin/traceroute6'), {}),
			L.resolveDefault(fs.stat('/usr/bin/arp-scan'), {}),
            L.resolveDefault(fs.stat('/usr/bin/vcgencmd'), {}),
            L.resolveDefault(fs.stat('/usr/bin/wanspeedtest'), {}),
			network.getDevices(),
			uci.load('luci')
		]);
	},

	render: function(res) {
		var has_ping6 = res[0].path || res[1].path,
		    has_traceroute6 = res[2].path || res[3].path,
		    has_arpscan = res[4].path,
		    has_vcgencmd = res[5].path,
		    has_wanspeed = res[6].path,
		    devices = res[7],
			dns_host = uci.get('luci', 'diag', 'dns') || 'openwrt.org',
			ping_host = uci.get('luci', 'diag', 'ping') || 'openwrt.org',
			route_host = uci.get('luci', 'diag', 'route') || 'openwrt.org';

		return E([], [
			E('h2', {}, [ _('Diagnostic Utilities') ]),
			E('table', { 'class': 'table' }, [
				E('tr', { 'class': 'tr' }, [
					has_vcgencmd ? E('td', { 'class': 'td left' }, [
						E('select', {
							'style':'margin:5px 0'
						}, [
							E('option', { 'value': 'get_throttled' }, [ _('Throttling history/status') ]),
							E('option', { 'value': 'bootloader_version' }, [ _('Bootloader version') ]),
							E('option', { 'value': 'measure_temp' }, [ _('Real Temperature') ]),
							E('option', { 'value': 'measure_clock arm' }, [ _('Real CPU Clock') ]),
						]),
						E('span', { 'class': 'diag-action' }, [
							E('button', {
								'class': 'cbi-button cbi-button-action',
								'click': ui.createHandlerFn(this, 'handleVcgencmd')
							}, [ _('Pi Status') ])
						])
					]) : E([]),

					has_wanspeed ? E('td', { 'class': 'td left' }, [
						E('select', {
							'style': 'margin:5px 0'
						}, devices.map(function(device) {
							if (!device.isUp())
								return E([]);

							return E('option', { 'value': device.getName() }, [ device.getI18n() ]);
						})),
						E('span', { 'class': 'diag-action' }, [
							E('button', {
								'class': 'cbi-button cbi-button-action',
								'click': ui.createHandlerFn(this, 'handleWanspeedtest')
							}, [ _('Download Test') ])
						])
					]) : E([]),
				]),
	
				E('tr', { 'class': 'tr' }, [
					E('td', { 'class': 'td left' }, [
						E('input', {
							'style': 'margin:5px 0',
							'type': 'text',
							'value': ping_host
						}),
						E('span', { 'class': 'diag-action' }, [
							has_ping6 ? new ui.ComboButton('ping', {
								'ping': '%s %s'.format(_('IPv4'), _('Ping')),
								'ping6': '%s %s'.format(_('IPv6'), _('Ping')),
							}, {
								'click': ui.createHandlerFn(this, 'handlePing'),
								'classes': {
									'ping': 'btn cbi-button cbi-button-action',
									'ping6': 'btn cbi-button cbi-button-action'
								}
							}).render() : E('button', {
								'class': 'cbi-button cbi-button-action',
								'click': ui.createHandlerFn(this, 'handlePing')
							}, [ _('Ping') ])
						])
					]),

					E('td', { 'class': 'td left' }, [
						E('input', {
							'style': 'margin:5px 0',
							'type': 'text',
							'value': route_host
						}),
						E('span', { 'class': 'diag-action' }, [
							has_traceroute6 ? new ui.ComboButton('traceroute', {
								'traceroute': '%s %s'.format(_('IPv4'), _('Traceroute')),
								'traceroute6': '%s %s'.format(_('IPv6'), _('Traceroute')),
							}, {
								'click': ui.createHandlerFn(this, 'handleTraceroute'),
								'classes': {
									'traceroute': 'btn cbi-button cbi-button-action',
									'traceroute6': 'btn cbi-button cbi-button-action'
								}
							}).render() : E('button', {
								'class': 'cbi-button cbi-button-action',
								'click': ui.createHandlerFn(this, 'handleTraceroute')
							}, [ _('Traceroute') ])
						])
					]),

					E('td', { 'class': 'td left' }, [
						E('input', {
							'style': 'margin:5px 0',
							'type': 'text',
							'value': dns_host
						}),
						E('span', { 'class': 'diag-action' }, [
							E('button', {
								'class': 'cbi-button cbi-button-action',
								'click': ui.createHandlerFn(this, 'handleNslookup')
							}, [ _('Nslookup') ])
						])
					]),

					has_arpscan ? E('td', { 'class': 'td left' }, [
						E('select', {
							'style': 'margin:5px 0'
						}, devices.map(function(device) {
							if (!device.isUp())
								return E([]);

							return E('option', { 'value': device.getName() }, [ device.getI18n() ]);
						})),
						E('span', { 'class': 'diag-action' }, [
							E('button', {
								'class': 'cbi-button cbi-button-action',
								'click': ui.createHandlerFn(this, 'handleArpScan')
							}, [ _('Arp-scan') ])
						])
					]) : E([])
				])
			]),
			E('pre', { 'class': 'command-output', 'style': 'display:none' })
		]);
	},

	handleSaveApply: null,
	handleSave: null,
	handleReset: null
});
