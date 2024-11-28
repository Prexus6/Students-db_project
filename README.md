## Dokumentácia projektu: Správa kurzov a študentov
Projekt vytvorený v rámci kurzu [SDA](https://sdacademy.dev/)


### Cieľ projektu
Hlavným cieľom projektu je vytvoriť databázový systém na správu kurzov, študentov a trénerov. Systém umožňuje evidenciu kurzov, priradenie študentov do kurzov, ako aj správu trénerov.

### Popis databázových tabuliek
1. ***Tabuľka: course***
   - Účel: Uchováva informácie o dostupných kurzoch.
   -  Kľúčové stĺpce:
        - course_id: Unikátne ID kurzu (primárny kľúč).
       - course_name: Názov kurzu.
       - start_date: Dátum začatia kurzu.
       - end_date: Dátum ukončenia kurzu.
       - description: Popis kurzu.
       - trainer_id: ID trénera, ktorý kurz vedie (cudzí kľúč na trainers).
      
2. ***Tabuľka: student***
- Účel: Uchováva údaje o študentoch prihlásených do kurzov.
- Kľúčové stĺpce:
  - student_id: Unikátne ID študenta (primárny kľúč).
    - first_name: Meno študenta.
    - last_name: Priezvisko študenta. 
    - email: Unikátna e-mailová adresa.
    - phone: Telefónne číslo.
    - address: Adresa študenta.
3. ***Tabuľka: trainers***
- Účel: Uchováva údaje o tréneroch, ktorí vedú kurzy.
- Kľúčové stĺpce:
  - trainer_id: Unikátne ID trénera (primárny kľúč).
  - first_name: Meno trénera.
  -  last_name: Priezvisko trénera.
  - email: Unikátna e-mailová adresa.
  - expertise: Oblasť odbornosti trénera.
  
4. ***Tabuľka: student_course_signup***
- Účel: Prepojenie študentov a kurzov, umožňuje evidenciu prihlásení.
- Kľúčové stĺpce:
    - signup_id: Unikátne ID prihlásenia (primárny kľúč).
    - student_id: ID študenta (cudzí kľúč na student).
    - course_id: ID kurzu (cudzí kľúč na course).
    - signup_date: Dátum prihlásenia (predvolene aktuálny čas).

### Príklady dát
Projekt obsahuje testovacie dáta:

* Kurzy: SQL databázy, Python, Java, NoSQL, C#, JavaScript, Web Development atď.
* Tréneri: John Doe (SQL), Jane Smith (Python), Michael Johnson (Java) atď.
* Študenti: Jana Nováková, Martin Kováč, Veronika Horváthová atď.

### Použité technológie
* Databáza: MySQL
* Engine: InnoDB
* Jazyk pre skripty: SQL
### Záver
Projekt ilustruje návrh a implementáciu relačnej databázy pre správu študentov a kurzov. Bol vytvorený v rámci vzdelávacieho kurzu SDA s dôrazom na praktické pochopenie vzťahov v databázach a manipuláciu s údajmi.