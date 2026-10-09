<div align="center">

<h1>PersonaStack for macOS</h1>

<p>Your PersonaStack workspace in a native Mac app.</p>

<img src="assets/personastack-macos.png" alt="PersonaStack sign-in screen in the macOS app" width="900">

</div>

## Install

Requires macOS 14 or later.

```sh
brew install --cask personastack/tap/personastack
```

Open PersonaStack from Applications and sign in. The app is currently unsigned. If macOS blocks the first launch, open **System Settings → Privacy & Security** and choose **Open Anyway**.

## Updates

PersonaStack can check for signed updates from the menu-bar dropdown or the **PersonaStack** menu. Background downloads are optional. A prepared update is installed when you quit the app.

This tap also provides [PersonaStack Connector](Formula/personastack-connector.rb), a separate command-line tool for locally hosted persona runtimes.
