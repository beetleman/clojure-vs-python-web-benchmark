function sum(t)
    local sum = 0
    for k,v in pairs(t) do
        sum = sum + v
    end
    return sum
end

reqPerSec = function(summary)
   return summary['requests'] * 1000000 / summary['duration']
end

timeoutsErrors = function(summary)
   return summary['errors']['timeout']
end

allErrors = function(summary)
   return sum(summary['errors'])
end

KBPerSec = function(summary)
   return (summary['bytes'] / 1000) * 1000000 / summary['duration']
end

title = function()
   return os.getenv("TITLE")
end

delay = function()
   return os.getenv("DELAY")
end

done = function(summary, latency, requests)
   file = io.open ('./report.csv', 'a')
   line = string.format(
      "\"%s\",%i,%f,%f,%f,%f,%i,%i\n",
      title(),
      delay(),
      reqPerSec(summary),
      KBPerSec(summary),
      latency.mean,
      latency.stdev,
      timeoutsErrors(summary),
      allErrors(summary)
   )
   file = io.open ('./report.csv', 'a')
   file:write(line)
   file:close();
end
