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
                id                  BIGSERIAL PRIMARY KEY,
                date                DATE      NOT NULL UNIQUE,
                total_assets        FLOAT,
                total_liabilities   FLOAT,
                short_term_debt     FLOAT,
                long_term_debt      FLOAT,
                revenue             FLOAT,
                net_income          FLOAT,
                roa                 FLOAT,
                revenue_qoq         FLOAT,
                net_income_qoq      FLOAT,
                revenue_yoy         FLOAT,
                net_income_yoy      FLOAT,
                fund_available      INT,
                qoq_available       INT,
                yoy_available       INT
            )', t || '_fundamental');
    END LOOP;
END $$;
