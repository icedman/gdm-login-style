<br/>
<p align="center">
  <h3 align="center">Customize GDM login</h3>

  <p align="center">
    Customize the GDM login screen with your own background image.
    <br/>
    <br/>
  </p>
</p>

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/icedman)

## Features

* Safely customize the GDM login screen. No need to extract, and recompile shell resources.

## Install

To install the background and stylesheet:

```sh
make install
```

and to remove:

```sh
make uninstall
```

## Background image

Edit or replace *background.jpg*. This will be copied to:

```sh
/usr/share/backgrounds/gdm-login-background.jpg
```

## Customize

Edit stylesheet.css for a fully customized login screen.

```css
.login-dialog {
    background-color: transparent;
}

#lockScreenGroup,
#lockDialogGroup {
  background: url(file:///usr/share/backgrounds/gdm-login-background.jpg);
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
}
```
## Technical Information

The gdm login screen is run as user *gdm*. The extension will be installed and enabled at the *gdm* user profile. In some systems (like Arch linux), a dconf reset may be needed for user *gdm*.

```sh
sudo -u gdm dbus-launch dconf reset -f
```

## Credit

https://github.com/PRATAP-KUMAR/gdm-extension/
