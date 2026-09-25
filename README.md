# CircuitBreakers / profil organizace

Speciální repozitář **.github** pro veřejný profil organizace **CircuitBreakersTKM**.

- [Veřejný profil](./profile/README.md)
- [Grafika banneru](./profile/assets/circuitbreakers-banner.svg)
- [Web týmu](https://circuitbreakers.cloud/)

## Vizuální styl

Profil navazuje na týmový web: černá `#0a0a0a`, bílá, tlumená červená `#b83430` a světlejší červená `#e05a54` pro akcenty na tmavém pozadí. Banner používá technickou mřížku, výrazný název s obrysovým druhým řádkem a schematický motiv robota. Hlavní nápis je převedený na vektorové křivky, takže nezávisí na fontech dostupných při zobrazení na GitHubu.

Celý banner i textové odkazy vedou na **https://circuitbreakers.cloud/**. Profil používá Markdown a HTML podporované GitHubem; SVG nepotřebuje skripty ani externí obrázky či fonty.

## Obnovení cache banneru

Po úpravě SVG a před commitem spusťte z kořene repozitáře:

```powershell
pwsh -File scripts/refresh-banner.ps1
```

Skript aktualizuje adresu obrázku v profilu a parametr `v` odvodí z SHA-256 obsahu SVG. Změna grafiky tak vytvoří novou adresu pro cache obrázků GitHubu. Opakované spuštění beze změny grafiky ponechá stejnou verzi. Absolutní adresa funguje také při zobrazení profilu na stránce organizace. Aktualizace samotné stránky profilu může ještě záviset na cache GitHubu.

## Zásady úprav

- Veřejná tvrzení opírejte o dohledatelné zdroje.
- Rozlišujte **CircuitBreakers** (regionální tým z Litoměřic) a **RobUL #9585** (výběrový FRC tým).
- Do profilu nekopírujte neveřejný soutěžní kód.
- Osobní údaje studentů nezveřejňujte bez výslovného souhlasu.
- U soutěžních výsledků a historie upřednostňujte FIRST, RobUL, UJEP a ICUK.
- Průběžně aktualizujte výsledky a formulace týkající se plánovaných akcí.
- Veřejné texty pište česky; zachovejte názvy týmů, soutěží a technologií.
