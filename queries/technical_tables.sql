DO $$
DECLARE
    t TEXT;
    tickers TEXT[] := ARRAY[
        'aadi','admr','adro','akra','ammn','amrt','antm','asii',
        'bbca','bbni','bbri','bbtn','bmri','bren','bris','brpt',
        'cpin','ctra','excl','goto','icbp','inco','indf','inkp',
        'isat','itmg','jpfa','jsmr','klbf','mapa','mapi','mbma',
        'mdka','medc','nckl','pgas','pgeo','ptba','scma','smgr',
        'tlkm','towr','untr','unvr','arto'
    ];
BEGIN
    FOREACH t IN ARRAY tickers LOOP
        EXECUTE format('
            CREATE TABLE IF NOT EXISTS %I (
                id          BIGSERIAL PRIMARY KEY,
                date        DATE    NOT NULL UNIQUE,
                open        FLOAT,
                high        FLOAT,
                low         FLOAT,
                close       FLOAT,
                volume      FLOAT,
                sma_5       FLOAT,
                sma_20      FLOAT,
                rsi_14      FLOAT,
                bb_upper    FLOAT,
                bb_lower    FLOAT,
                macd        FLOAT,
                macd_signal FLOAT,
                atr_14      FLOAT,
                obv         FLOAT,
                stoch_k     FLOAT,
                stoch_d     FLOAT,
                return_1d   FLOAT,
                return_3d   FLOAT,
                return_5d   FLOAT
            )', t || '_technical');
    END LOOP;
END $$;
