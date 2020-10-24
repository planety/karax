import prologue
import prologue/middlewares/staticfile


proc serverHTML(ctx: Context) {.async.} =
  await staticFileResponse(ctx, "app.html", "")

proc serverJS(ctx: Context) {.async.} =
  await staticFileResponse(ctx, "app.js", "")

var app = newApp()
app.use(staticFileMiddleware("/assets"))
app.get("/", serverHTML)
app.get("/app.js", serverJS)
app.run()
