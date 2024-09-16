# Getting started

### For a quick setup run the following command on your macOS terminal or windows powershell:

```
. ./setup.bash
```

If the script doesn't work ensure node version >=20 is installed on you machine then try again.

Once the script finishes,create 2 terminal/cmd instances,then type the following in the first instance to start the backend server:

```
cd backend
node index.js
```

Then on the second instance run the following to start the frontend server:

```
cd frontend
yarn start
```