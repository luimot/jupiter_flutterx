# RADAGAST

**RA**dio **D**ata **A**cquisition and **G**raphical **A**nalysis **S**ys**T**em

A powerful tool for the rocketeers in need of a Mission Control GUI, inspired by Projeto Jupiter's PyRX.

## Installing

This project requires [Flutter](https://docs.flutter.dev/get-started/install) as the GUI and python using [FastAPI](https://fastapi.tiangolo.com/)'s WebSocket and pyserial for reading JSON data through the serial port.

At first run:

```
$ flutter pub get
```

and

```
$ flutter devices
$ flutter build -d [device]
```

Where devices show which are available to compile/transpile and run, for now there are only Web and Linux versions tested.

For the server, it is needed to only run with pip for installation of packages:

```
$ pip install -r requirements.txt
```

And then for using uvicorn in debug:

```
$ uvicorn serialServer:app --reload --port 3000
```

[Radagast (Adûnaic; IPA: ['radagast] - "Tender Of Beasts")](https://lotr.fandom.com/wiki/Radagast)
