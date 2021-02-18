'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "android-chrome-192x192.png": "94c581608de7e83d1944f99872581954",
"android-chrome-512x512.png": "d9f5a25480e4fbe5a3a0120aed0a6a2d",
"apple-touch-icon.png": "6422e9b0e7d4e2e7a60985da586c7f89",
"assets/AssetManifest.json": "965bdd5601fe16ba7dbb947e502edc63",
"assets/ball_mobile.mp4": "c1c1f9363990766b50f2cea124589de0",
"assets/ball_vid.mp4": "050b71f099f126ff69e182fb899b4247",
"assets/FontManifest.json": "b0cf87950ed96a1bbbd1f83fa411f8ec",
"assets/fonts/Cervanttis.ttf": "8a36acddd14b502511b291a0b29cbde9",
"assets/fonts/DMSans/DMSans-Bold.ttf": "071853031a2175ada019db9e6fd1585c",
"assets/fonts/DMSans/DMSans-BoldItalic.ttf": "a300c77208334f8ad8b2fc95ee2040ce",
"assets/fonts/DMSans/DMSans-Italic.ttf": "b89267290c0df2e03ae1b60bd14109c8",
"assets/fonts/DMSans/DMSans-Medium.ttf": "fbbc5a515be4021a9a36f048e25ad396",
"assets/fonts/DMSans/DMSans-MediumItalic.ttf": "a2a143d61d86a67e5e77cf43fd0a4e59",
"assets/fonts/DMSans/DMSans-Regular.ttf": "3e7f038b85daa739336e4a3476c687f2",
"assets/fonts/galderglynn_titling_rg.ttf": "d39e13f733ae4a6bb6a4803241421a94",
"assets/fonts/helveticaneue/Helvetica%20Neu%20Bold.ttf": "7f281199258d96e249a7fce4101006b9",
"assets/fonts/helveticaneue/HelveticaNeue%20BlackCond.ttf": "4ff686ee78ff095848014f4283f67a41",
"assets/fonts/helveticaneue/HelveticaNeue%20Light.ttf": "0facaae97183b8fede52099930aefd8d",
"assets/fonts/helveticaneue/HelveticaNeue%20Medium.ttf": "0a13c540938b1b7dd3996b02ea568e5f",
"assets/fonts/helveticaneue/HelveticaNeue%20Thin.ttf": "78c28465643a20597ce65eee037a7675",
"assets/fonts/helveticaneue/HelveticaNeue.ttf": "ccad04d46768981ff847f22e8a53b5b3",
"assets/fonts/helveticaneue/HelveticaNeueBd.ttf": "b8edca3e45f1f16bc6e20464bd8f2fff",
"assets/fonts/helveticaneue/HelveticaNeueHv.ttf": "c1e969c8f421f5f755e1e68d21d93b78",
"assets/fonts/helveticaneue/HelveticaNeueIt.ttf": "33baa0a123d13fcda4e6cad9c93ed2ef",
"assets/fonts/helveticaneue/HelveticaNeueLt.ttf": "bb5671edae4b3cecbd3c98159511f2ea",
"assets/fonts/helveticaneue/HelveticaNeueMed.ttf": "9f25b1f8c62ddd2ad699a89aaaf11a59",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/fonts/Montserrat/Montserrat-Black.ttf": "27e3649bab7c62fa21b8837c4842e40e",
"assets/fonts/Montserrat/Montserrat-BlackItalic.ttf": "d9b6ba595b059fc5d48e8f52c30f73b3",
"assets/fonts/Montserrat/Montserrat-Bold.ttf": "ade91f473255991f410f61857696434b",
"assets/fonts/Montserrat/Montserrat-BoldItalic.ttf": "1b38414956c666bd1df78fe5b9c84756",
"assets/fonts/Montserrat/Montserrat-ExtraBold.ttf": "19ba7aa52a78c3896558ac1c0a5fb4c7",
"assets/fonts/Montserrat/Montserrat-ExtraBoldItalic.ttf": "52a50ca037f2f96fa567404dc3c5bdfb",
"assets/fonts/Montserrat/Montserrat-ExtraLight.ttf": "570a244cacd3d78b8c75ac5dd622f537",
"assets/fonts/Montserrat/Montserrat-ExtraLightItalic.ttf": "1170df5548b7e238df5fa14b6f1a753e",
"assets/fonts/Montserrat/Montserrat-Italic.ttf": "a7063e0c0f0cb546ad45e9e24b27bd3b",
"assets/fonts/Montserrat/Montserrat-Light.ttf": "409c7f79a42e56c785f50ed37535f0be",
"assets/fonts/Montserrat/Montserrat-LightItalic.ttf": "01c4560c9c15069b6700ce7ad2e49a9c",
"assets/fonts/Montserrat/Montserrat-Medium.ttf": "c8b6e083af3f94009801989c3739425e",
"assets/fonts/Montserrat/Montserrat-MediumItalic.ttf": "40a74702035bf9ef19053c84ce9a58b9",
"assets/fonts/Montserrat/Montserrat-Regular.ttf": "ee6539921d713482b8ccd4d0d23961bb",
"assets/fonts/Montserrat/Montserrat-SemiBold.ttf": "c641dbee1d75892e4d88bdc31560c91b",
"assets/fonts/Montserrat/Montserrat-SemiBoldItalic.ttf": "83c1ec1f1db9a6416791f7d9d29536f2",
"assets/fonts/Montserrat/Montserrat-Thin.ttf": "43dd5b7a3d277362d5e801e5353e3a01",
"assets/fonts/Montserrat/Montserrat-ThinItalic.ttf": "3c2b290f95cd5b33c3ead2911064a2ab",
"assets/fonts/Montserrat.zip": "9b3f34d7bf1dadf50c03ca7dbff6abb2",
"assets/fonts/Poppins/Poppins-Black.ttf": "0573b9231a8316427ad6e751b52e87a4",
"assets/fonts/Poppins/Poppins-BlackItalic.ttf": "3fb21c8084013f3d0176bc98bcf76e60",
"assets/fonts/Poppins/Poppins-Bold.ttf": "a3e0b5f427803a187c1b62c5919196aa",
"assets/fonts/Poppins/Poppins-BoldItalic.ttf": "09775bde3e9448b38c063b746e21cb6b",
"assets/fonts/Poppins/Poppins-ExtraBold.ttf": "544fa4f2678a8285eb88b8dfe503c90c",
"assets/fonts/Poppins/Poppins-ExtraBoldItalic.ttf": "29f7dd016eeed2bcd79ba482eb3f27ec",
"assets/fonts/Poppins/Poppins-ExtraLight.ttf": "86a2f13e91ac85080ebaeaab9463b9f1",
"assets/fonts/Poppins/Poppins-ExtraLightItalic.ttf": "05139b6509a2baa8f188fbade78fc3ed",
"assets/fonts/Poppins/Poppins-Italic.ttf": "5e956c44060a7b3c0e39819ae390ab15",
"assets/fonts/Poppins/Poppins-Light.ttf": "f6ea751e936ade6edcd03a26b8153b4a",
"assets/fonts/Poppins/Poppins-LightItalic.ttf": "1eaf3af47612e6163a2e27e847c6ac7d",
"assets/fonts/Poppins/Poppins-Medium.ttf": "f61a4eb27371b7453bf5b12ab3648b9e",
"assets/fonts/Poppins/Poppins-MediumItalic.ttf": "1749e4b603749026393f64506a3bcbbe",
"assets/fonts/Poppins/Poppins-Regular.ttf": "8b6af8e5e8324edfd77af8b3b35d7f9c",
"assets/fonts/Poppins/Poppins-SemiBold.ttf": "4cdacb8f89d588d69e8570edcbe49507",
"assets/fonts/Poppins/Poppins-SemiBoldItalic.ttf": "378a091bc1b1e6e6d6327beb6bfb07b9",
"assets/fonts/Poppins/Poppins-Thin.ttf": "25cd0f688f815bc4f6ac2b71eb6278ba",
"assets/fonts/Poppins/Poppins-ThinItalic.ttf": "c93e22e98b7a8d58f83ce42b278815eb",
"assets/images/ball_sc1.png": "895d20a5c77bbc54143874c2311246e2",
"assets/images/ball_sc2.png": "13efcb36ce4e931c80ee6776731c944a",
"assets/images/ball_sc3.png": "6c027589c4f93fc512234d33bc2a4971",
"assets/images/circles_bg.png": "8259ea9b9975384be14f2aecb6696ea0",
"assets/images/discord.png": "9e330346c9509348c0c866323d389663",
"assets/images/img1.png": "570f31cdcc725205344bc6e933876859",
"assets/images/img2.png": "e420542d70173406fb41324f312fa962",
"assets/images/img3.png": "8a9b3641b183cb3082167cbddcb97f9f",
"assets/images/img4.png": "74c0462ad7f3601259a182471d5a5e6d",
"assets/images/img5.png": "48f3615497cc08043f64560fe5748339",
"assets/images/img6.png": "c8415f1f356a2b33af20b907c0094a98",
"assets/images/pixedio.png": "f7a5eda0c2fee3615f9252468375c1ce",
"assets/images/Scroll.png": "1798f9d404725799b1eaede9109f1dda",
"assets/images/whatsapp.png": "e03fb54f6bdb60c8737ef4d6528b7dbb",
"assets/NOTICES": "3dd4b615bcd8fe7b38b2bf0c246e296e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/wakelock_web/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/web/assets/ball_mobile.mp4": "c1c1f9363990766b50f2cea124589de0",
"assets/web/assets/ball_vid.mp4": "050b71f099f126ff69e182fb899b4247",
"assets/web/assets/fonts/Cervanttis.ttf": "8a36acddd14b502511b291a0b29cbde9",
"assets/web/assets/fonts/DMSans/DMSans-Regular.ttf": "3e7f038b85daa739336e4a3476c687f2",
"assets/web/assets/fonts/galderglynn_titling_rg.ttf": "d39e13f733ae4a6bb6a4803241421a94",
"assets/web/assets/fonts/helveticaneue/Helvetica%2520Neu%2520Bold.ttf": "7f281199258d96e249a7fce4101006b9",
"assets/web/assets/fonts/helveticaneue/HelveticaNeue.ttf": "ccad04d46768981ff847f22e8a53b5b3",
"assets/web/assets/fonts/Montserrat/Montserrat-Bold.ttf": "ade91f473255991f410f61857696434b",
"assets/web/assets/fonts/Montserrat/Montserrat-Regular.ttf": "ee6539921d713482b8ccd4d0d23961bb",
"assets/web/assets/fonts/Montserrat.zip": "9b3f34d7bf1dadf50c03ca7dbff6abb2",
"assets/web/assets/fonts/Poppins/Poppins-Regular.ttf": "8b6af8e5e8324edfd77af8b3b35d7f9c",
"assets/web/assets/fonts/Poppins/Poppins-Thin.ttf": "25cd0f688f815bc4f6ac2b71eb6278ba",
"assets/web/assets/images/ball_sc1.png": "895d20a5c77bbc54143874c2311246e2",
"assets/web/assets/images/ball_sc2.png": "13efcb36ce4e931c80ee6776731c944a",
"assets/web/assets/images/ball_sc3.png": "6c027589c4f93fc512234d33bc2a4971",
"assets/web/assets/images/circles_bg.png": "8259ea9b9975384be14f2aecb6696ea0",
"assets/web/assets/images/discord.png": "9e330346c9509348c0c866323d389663",
"assets/web/assets/images/img1.png": "570f31cdcc725205344bc6e933876859",
"assets/web/assets/images/img2.png": "e420542d70173406fb41324f312fa962",
"assets/web/assets/images/img3.png": "8a9b3641b183cb3082167cbddcb97f9f",
"assets/web/assets/images/img4.png": "74c0462ad7f3601259a182471d5a5e6d",
"assets/web/assets/images/img5.png": "48f3615497cc08043f64560fe5748339",
"assets/web/assets/images/img6.png": "c8415f1f356a2b33af20b907c0094a98",
"assets/web/assets/images/pixedio.png": "f7a5eda0c2fee3615f9252468375c1ce",
"assets/web/assets/images/Scroll.png": "1798f9d404725799b1eaede9109f1dda",
"assets/web/assets/images/whatsapp.png": "e03fb54f6bdb60c8737ef4d6528b7dbb",
"favicon-16x16.png": "1c931e3e6d1981d0406aed5251fe47e1",
"favicon-32x32.png": "8627931443e88e81adc39c080e4cbd3c",
"favicon.ico": "042b7bb839fa20968eef8ede6aaeb885",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "23fff876013ecd72e0c989d7181b6f6d",
"/": "23fff876013ecd72e0c989d7181b6f6d",
"main.dart.js": "38238b33081019936287ec196e5f3cc5",
"manifest.json": "88e3deda77464db730cad25e9da9c4b9",
"site.webmanifest": "053100cb84a50d2ae7f5492f7dd7f25e",
"version.json": "e30ad8e9f17d1c3c703c161be132c996"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
