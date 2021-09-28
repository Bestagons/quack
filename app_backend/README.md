# App Backend

This directory implements the backend implementation for all App related features.

## Installation

Make sure you have python +3.7 installed. It is recommended that you have Anaconda installed and run the following: `conda create -n appenv python=3.9`

Make sure you have all dependencies installed by running `python -m pip install -r requirements.txt`

Then, run `uvicorn server:app` to start the localhost server.

## Routes

### /

The `/` route currently returns a JSON Object:
```json
{
	message: "This is the App Backend"
}
```

## Contributors

@oreorz
