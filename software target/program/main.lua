-- Глобальная таблица для поддержания информации
-- о состоянии соединения.
mod = {}

-- Зпуск всех соединений
function gotmqttnow()
    -- Загрузка модуля ожидания wifi
    wf = require("getwifi")
    -- Сallback на появление сети
    local call = function()
        -- Создание объекта MQTT
        dofile("workmqtt.lua")
        -- уничтожение переменной, содержавшей ссылку на модуль wifi,
        -- выгрузка этого модуля происходит в нем самом после появления
        -- сети
        wf = nil
        print("wf = ", wf)
    end
    wf.getwifi(call)
end
-- первый запуск после включения
gotmqttnow()