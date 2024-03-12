import Koa from 'koa';
import Router from 'koa-router';

// Read .env file to preload environment variable.
require('dotenv').config();

// Initialize the router.
const router = new Router();

// Register healthcheck, ready and metrics routes prefixed by /@/
router.get('/@/healthcheck', ctx => {
  ctx.body = {
    status: 'success',
    message: 'Health check passed'
  };
  ctx.status = 200;
});

router.get('/@/ready', ctx => {
  ctx.body = {
    status: 'success',
    message: 'Ready check passed'
  };
  ctx.status = 200;
});

router.get('/@/metrics', ctx => {
  ctx.body = {
    status: 'success',
    message: 'Metrics report'
  };
  ctx.status = 200;
});

const app = new Koa();

app.use(router.routes());

// Listen on the PORT specified in the .env file or default to 3000
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`🚀 Server is running on port http://localhost:${port}/`);
});
