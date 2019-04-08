[![License](https://img.shields.io/github/license/solokeys/solo.svg)](https://github.com/solokeys/solo/blob/master/LICENSE)
[![Build Status](https://travis-ci.com/solokeys/solo.svg?branch=master)](https://travis-ci.com/solokeys/solo)
[![Discourse Users](https://img.shields.io/discourse/https/discourse.solokeys.com/users.svg)](https://discourse.solokeys.com)
[![Keybase Chat](https://img.shields.io/badge/chat-on%20keybase-brightgreen.svg)](https://keybase.io/team/solokeys.public)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fsolokeys%2Fsolo.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fsolokeys%2Fsolo?ref=badge_shield)

[![latest release](https://img.shields.io/github/release/solokeys/solo.svg)](https://github.com/solokeys/solo/releases)
[![commits since last release](https://img.shields.io/github/commits-since/solokeys/solo/latest.svg)](https://github.com/solokeys/solo/commits/master)
[![last commit](https://img.shields.io/github/last-commit/solokeys/solo.svg)](https://github.com/solokeys/solo/commits/master)
[![commit activity](https://img.shields.io/github/commit-activity/m/solokeys/solo.svg)](https://github.com/solokeys/solo/commits/master)
[![contributors](https://img.shields.io/github/contributors/solokeys/solo.svg)](https://github.com/solokeys/solo/graphs/contributors)


# Solo

Solo is an open source security key, and you can get one at [solokeys.com](https://solokeys.com).

Solo supports FIDO2 and U2F standards for strong two-factor authentication and password-less login, and it will protect you against phishing and other online attacks. With colored cases and multilingual guides we want to make secure login more personable and accessible to everyone around the globe.

<img src="https://solokeys.com/images/photos/hero-on-white-cropped.png" width="600">

This repo contains the Solo firmware, including implementations of FIDO2 and U2F (CTAP2 and CTAP) over USB and NFC. The main implementation is for STM32L432, but it is easily portable.

For development no hardware is needed, Solo also runs as a standalone application for Windows, Linux, and Mac OSX. If you like (or want to learn) hardware instead, you can run Solo on the NUCLEO-L432KC development board, or we make Solo for Hacker, an unlocked version of Solo that lets you customize its firmware.


# Security

Solo is based on the STM32L432 microcontroller. It offers the following security features.

- True random number generation to guarantee random keys.
- Security isolation so only simple & secure parts of code can handle keys.
- Flash protection from both external use and untrusted code segments.
- 256 KB of memory to support hardened crypto implementations and, later, additional features such as OpenPGP or SSH.
- No NDA needed to develop for.


# Solo for Hackers

Solo for Hacker is a special version of Solo that let you customize its firmware, for example you can change the LED color, and even build advanced applications.

Check out [solokeys.com](https://solokeys.com), for options on where to buy Solo.  Solo Hacker can be converted to a secure version, but normal Solo cannot be converted to a Hacker version.

If you have a Solo for Hacker, here's how you can load your own code on it. You can find more details, including how to permanently lock it, in our [documentation](https://docs.solokeys.io/solo/building/). We only support Python3.

```bash
git clone --recurse-submodules https://github.com/solokeys/solo
cd solo

cd targets/stm32l432
make cbor
make build-hacker
cd ../..

make venv
source venv/bin/activate
solo program aux enter-bootloader
solo program bootloader targets/stm32l432/solo.hex
```

Alternatively, run `make docker-build` and use the firmware generated in `/tmp`.

If you forgot the `--recurse-submodules` when cloning, simply `git submodule update --init --recursive`.

For example, if you want to turn off any blue light emission, you can edit [`led_rgb()`](https://github.com/solokeys/solo/blob/master/targets/stm32l432/src/app.h#L48) and change `LED_INIT_VALUE`
to be a different hex color.

Then recompile, load your new firmware, and enjoy a different LED color Solo.

In the Hacker version, hardware is the same but the firmware is unlocked, so you can 1) load an unsigned application, or 2) entirely reflash the key. By contrast, in a regular Solo you can only upgrade to a firmware signed by SoloKeys, and flash is locked and debug disabled permanently.

Hacker Solo isn't really secure so you should only use it for development. An attacker with physical access to a Solo for Hacker can reflash it following the steps above, and even a malware on your computer could possibly reflash it.

# Developing Solo (No Hardware Needed)

Clone Solo and build it

```bash
git clone --recurse-submodules https://github.com/solokeys/solo
cd solo
make all
```

This builds Solo as a standalone application. Solo application is set up to send and recv USB HID messages over UDP to ease development and reduce need for hardware.

Testing can be done using our fork of Yubico's client software, python-fido2. Our fork of python-fido2 has small changes to make it send USB HID over UDP to the authenticator application. You can install our fork by running the following:

```bash
pip install -r tools/requirements.txt
```

Run the Solo application:
```bash
./main
```

In another shell, you can run client software, for example our tests:
```bash
python tools/testing/main.py sim fido2
```

You can find more details in our [documentation](https://docs.solokeys.io/solo/), including how to build on the the NUCLEO-L432KC development board.


# Documentation

Check out our [official documentation](https://docs.solokeys.io/solo/).


# Contributors

Solo is an upgrade to [U2F Zero](https://github.com/conorpp/u2f-zero). It was born from Conor's passion for making secure hardware, and from our shared belief that security should be open to be trustworthy, in hardware like in software.

Contributors are welcome. The ultimate goal is to have a FIDO2 security key supporting USB, NFC, and BLE interfaces, that can run on a variety of MCUs.

Look at the issues to see what is currently being worked on. Feel free to add issues as well.


# License

Solo is fully open source.

All software, unless otherwise noted, is dual licensed under Apache 2.0 and MIT.
You may use Solo software under the terms of either the Apache 2.0 license or MIT license.

All hardware, unless otherwise noted, is dual licensed under CERN and CC-BY-SA.
You may use Solo hardware under the terms of either the CERN 2.1 license or CC-BY-SA 4.0 license.

All documentation, unless otherwise noted, is licensed under CC-BY-SA.
You may use Solo documentation under the terms of the CC-BY-SA 4.0 license


[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fsolokeys%2Fsolo.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fsolokeys%2Fsolo?ref=badge_large)

# Where To Buy Solo

You can buy Solo, Solo Tap, and Solo for Hackers at [solokeys.com](https://solokeys.com).
