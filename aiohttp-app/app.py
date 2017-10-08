import asyncio
from aiohttp import web


def toInt(x):
    try:
        return int(x)
    except Exception:
        return 0


async def index(request):
    delay = request.GET.get('delay')
    await asyncio.sleep(toInt(delay)/1000)
    return web.Response(text="hello word!")


app = web.Application()
app.router.add_get('/', index)
