{ nodeEnv, fetchurl, globalBuildInputs, sources }:

nodeEnv.buildNodePackage {
  name = "webtorrent-cli";
  packageName = "webtorrent-cli";
  version = "1.12.3";
  src = fetchurl {
    url = "https://registry.npmjs.org/webtorrent-cli/-/webtorrent-cli-1.12.3.tgz";
    sha512 = "NnBAGkD64CRsl9edM9q0QU+ku6nCX32nM0U+YC8Gs/36c8y+5m9Tya3mWIux3oZKZ54yGiVtnok4tUpqDE5tMA==";
  };
  dependencies = [
    sources."addr-to-ip-port-1.4.3"
    sources."airplay-js-0.3.0"
    sources."ansi-regex-2.1.1"
    sources."aproba-1.2.0"
    sources."are-we-there-yet-1.1.5"
    sources."ascli-0.3.0"
    sources."async-limiter-1.0.0"
    sources."balanced-match-1.0.0"
    sources."bencode-2.0.0"
    sources."binary-search-1.3.4"
    sources."bindings-1.3.0"
    sources."bitfield-2.0.0"
    (sources."bittorrent-dht-8.4.0" // {
      dependencies = [
        sources."debug-3.1.0"
      ];
    })
    sources."bittorrent-peerid-1.2.0"
    (sources."bittorrent-protocol-2.4.2" // {
      dependencies = [
        sources."debug-3.1.0"
      ];
    })
    (sources."bittorrent-tracker-9.9.1" // {
      dependencies = [
        sources."debug-3.1.0"
        sources."simple-get-3.0.2"
      ];
    })
    sources."bl-1.2.2"
    sources."blob-to-buffer-1.2.8"
    sources."block-stream2-1.1.0"
    sources."bn.js-4.11.8"
    sources."brace-expansion-1.1.11"
    sources."browserify-package-json-1.0.1"
    sources."buffer-alloc-1.2.0"
    sources."buffer-alloc-unsafe-1.1.0"
    sources."buffer-equals-1.0.4"
    sources."buffer-fill-1.0.0"
    sources."buffer-from-1.1.0"
    sources."buffer-indexof-1.1.1"
    sources."bufferutil-3.0.5"
    sources."bufferview-1.0.1"
    sources."bytebuffer-3.5.5"
    sources."castv2-0.1.9"
    sources."castv2-client-1.2.0"
    sources."chownr-1.0.1"
    (sources."chromecasts-1.9.1" // {
      dependencies = [
        sources."mime-1.6.0"
      ];
    })
    sources."chunk-store-stream-2.1.0"
    sources."clivas-0.2.0"
    sources."closest-to-2.0.0"
    sources."code-point-at-1.1.0"
    sources."colour-0.7.1"
    sources."compact2string-1.4.0"
    sources."concat-map-0.0.1"
    sources."concat-stream-1.6.2"
    sources."console-control-strings-1.1.0"
    sources."core-util-is-1.0.2"
    sources."create-torrent-3.32.0"
    sources."debug-2.6.9"
    sources."decompress-response-3.3.0"
    sources."deep-extend-0.6.0"
    sources."defined-1.0.0"
    sources."delegates-1.0.0"
    sources."detect-libc-1.0.3"
    (sources."dlnacasts-0.1.0" // {
      dependencies = [
        sources."mime-1.6.0"
      ];
    })
    sources."dns-packet-1.3.1"
    sources."dns-txt-2.0.2"
    (sources."ecstatic-3.2.0" // {
      dependencies = [
        sources."mime-1.6.0"
      ];
    })
    sources."elementtree-0.1.7"
    sources."end-of-stream-1.4.1"
    sources."executable-4.1.1"
    sources."expand-template-1.1.1"
    sources."filestream-4.1.3"
    sources."flatten-1.0.2"
    (sources."fs-chunk-store-1.7.0" // {
      dependencies = [
        sources."thunky-1.0.2"
      ];
    })
    sources."fs-constants-1.0.0"
    sources."fs.realpath-1.0.0"
    sources."gauge-2.7.4"
    sources."get-browser-rtc-1.0.2"
    sources."get-stdin-6.0.0"
    sources."github-from-package-0.0.0"
    sources."glob-7.1.2"
    sources."has-unicode-2.0.1"
    sources."he-1.1.1"
    sources."immediate-chunk-store-1.0.8"
    sources."inflight-1.0.6"
    sources."inherits-2.0.3"
    sources."ini-1.3.5"
    sources."ip-1.1.5"
    sources."ip-set-1.0.1"
    sources."ipaddr.js-1.7.0"
    sources."is-ascii-1.0.0"
    sources."is-file-1.0.0"
    sources."is-fullwidth-code-point-1.0.0"
    sources."is-typedarray-1.0.0"
    sources."isarray-1.0.0"
    sources."junk-2.1.0"
    sources."k-bucket-4.0.1"
    sources."k-rpc-5.0.0"
    sources."k-rpc-socket-1.8.0"
    sources."last-one-wins-1.0.4"
    sources."load-ip-set-1.3.1"
    sources."long-2.4.0"
    sources."lru-3.1.0"
    sources."magnet-uri-5.1.8"
    (sources."mdns-js-0.5.0" // {
      dependencies = [
        sources."semver-5.1.1"
      ];
    })
    sources."mdns-js-packet-0.2.0"
    sources."mediasource-2.2.1"
    sources."memory-chunk-store-1.3.0"
    sources."mime-2.3.1"
    sources."mimic-response-1.0.0"
    sources."minimatch-3.0.4"
    sources."minimist-1.2.0"
    (sources."mkdirp-0.5.1" // {
      dependencies = [
        sources."minimist-0.0.8"
      ];
    })
    sources."moment-2.22.2"
    sources."mp4-box-encoding-1.1.4"
    sources."mp4-stream-2.0.3"
    sources."ms-2.0.0"
    (sources."multicast-dns-6.2.3" // {
      dependencies = [
        sources."thunky-1.0.2"
      ];
    })
    sources."multistream-2.1.1"
    sources."nan-2.10.0"
    sources."netmask-1.0.6"
    sources."network-address-1.1.2"
    sources."next-event-1.0.0"
    sources."node-abi-2.4.3"
    sources."node-ssdp-2.9.1"
    sources."nodebmc-0.0.7"
    sources."noop-logger-0.1.1"
    sources."npmlog-4.1.2"
    sources."number-is-nan-1.0.1"
    sources."object-assign-4.1.1"
    sources."once-1.4.0"
    sources."open-0.0.5"
    sources."optjs-3.2.2"
    sources."os-homedir-1.0.2"
    sources."package-json-versionify-1.0.4"
    sources."parse-numeric-range-0.0.2"
    (sources."parse-torrent-6.0.1" // {
      dependencies = [
        sources."simple-get-3.0.2"
      ];
    })
    sources."path-is-absolute-1.0.1"
    sources."piece-length-1.0.0"
    sources."pify-2.3.0"
    (sources."plist-with-patches-0.5.1" // {
      dependencies = [
        sources."xmlbuilder-0.4.3"
      ];
    })
    (sources."prebuild-install-4.0.0" // {
      dependencies = [
        sources."pump-2.0.1"
      ];
    })
    sources."prettier-bytes-1.0.4"
    sources."process-nextick-args-2.0.0"
    sources."protobufjs-3.8.2"
    sources."pump-3.0.0"
    sources."qap-3.3.1"
    sources."random-access-file-2.0.1"
    sources."random-access-storage-1.3.0"
    sources."random-iterate-1.0.1"
    sources."randombytes-2.0.6"
    sources."range-parser-1.2.0"
    sources."range-slice-stream-1.2.0"
    sources."rc-1.2.8"
    sources."readable-stream-2.3.6"
    sources."record-cache-1.1.0"
    (sources."render-media-3.1.0" // {
      dependencies = [
        sources."debug-3.1.0"
      ];
    })
    sources."rimraf-2.6.2"
    sources."run-parallel-1.1.9"
    sources."run-parallel-limit-1.0.5"
    sources."run-series-1.1.8"
    sources."rusha-0.8.13"
    sources."safe-buffer-5.1.2"
    sources."sax-1.1.4"
    sources."semver-5.5.0"
    sources."set-blocking-2.0.0"
    sources."signal-exit-3.0.2"
    sources."simple-concat-1.0.0"
    sources."simple-get-2.8.1"
    (sources."simple-peer-9.1.2" // {
      dependencies = [
        sources."debug-3.1.0"
      ];
    })
    sources."simple-sha1-2.1.1"
    (sources."simple-websocket-7.0.2" // {
      dependencies = [
        sources."debug-3.1.0"
        sources."ws-4.1.0"
      ];
    })
    sources."speedometer-1.1.0"
    sources."split-1.0.1"
    sources."stream-to-blob-1.0.1"
    sources."stream-to-blob-url-2.1.1"
    sources."stream-with-known-length-to-buffer-1.0.2"
    sources."string-width-1.0.2"
    sources."string2compact-1.2.5"
    sources."string_decoder-1.1.1"
    sources."strip-ansi-3.0.1"
    sources."strip-json-comments-2.0.1"
    (sources."tar-fs-1.16.3" // {
      dependencies = [
        sources."pump-1.0.3"
      ];
    })
    sources."tar-stream-1.6.1"
    sources."thirty-two-1.0.2"
    sources."through-2.3.8"
    sources."thunky-0.1.0"
    sources."to-arraybuffer-1.0.1"
    sources."to-buffer-1.1.1"
    (sources."torrent-discovery-8.4.1" // {
      dependencies = [
        sources."debug-3.1.0"
      ];
    })
    sources."torrent-piece-1.1.2"
    sources."tunnel-agent-0.6.0"
    sources."typedarray-0.0.6"
    sources."typedarray-to-buffer-3.1.5"
    sources."uint64be-1.0.1"
    sources."uniq-1.0.1"
    sources."unordered-array-remove-1.0.2"
    sources."upnp-device-client-1.0.2"
    sources."upnp-mediarenderer-client-1.2.4"
    sources."url-join-2.0.5"
    (sources."ut_metadata-3.2.2" // {
      dependencies = [
        sources."debug-3.1.0"
      ];
    })
    sources."ut_pex-1.2.1"
    sources."util-deprecate-1.0.2"
    (sources."videostream-2.4.2" // {
      dependencies = [
        sources."pump-1.0.3"
      ];
    })
    sources."vlc-command-1.1.1"
    (sources."webtorrent-0.100.0" // {
      dependencies = [
        sources."debug-3.1.0"
        sources."simple-get-3.0.2"
      ];
    })
    sources."which-pm-runs-1.0.0"
    sources."wide-align-1.1.3"
    sources."winreg-1.2.4"
    sources."wrappy-1.0.2"
    sources."ws-5.2.1"
    sources."xml2js-0.4.19"
    sources."xmlbuilder-9.0.7"
    sources."xmldom-0.1.27"
    sources."xtend-4.0.1"
    sources."zero-fill-2.2.3"
  ];
  buildInputs = globalBuildInputs;
  meta = {
    description = "WebTorrent, the streaming torrent client. For the command line.";
    homepage = https://webtorrent.io/;
    license = "MIT";
  };
  production = true;
  bypassCache = false;
}
