<script>
    let stichwort_input = "Fahrräder";
    let map_input = false;
    let ai_input = false;

    let stichwort_output = stichwort_input;
    let teamname_output = "teamname";
    let type_output = "App";
    let intent_output = "möchten";
    let means_output = "die Anwendung";
    let value_output = "lebenswerter";
    let map_output = false;
    let map_action_output = "sehen";
    let ai_output = false;
    let ai_variant_output = "KI";
    let ai_action_output = "identifiziert";
    let relevance_output = "relevanten";
    let city_output = "Münster";
    let user_output = "Nutzern";
    let techstack_output = "Svelte, FastAPI und Postgres";
    let needed_output = "Designer und Experten für " + stichwort_input;
    let closings_output = "Super. Nachhaltig. Jovel.";

    const TYPE_VARIANTS = ["App", "Lösung", "Idee", "Projekt"];
    const INTENT_VARIANTS = ["möchten", "wollen", "können", "müssen"];
    const MEANS_VARIANTS = ["die Anwendung", "die Visualisierung", "die Mithilfe", "das Angebot"];
    const VALUE_VARIANTS = ["lebenswerter", "sicherer", "schöner", "nachhaltiger"];
    const MAP_VARIANTS = ["sehen", "erkennen", "finden", "entdecken", "verschieben", "hinzufügen"];
    const AI_VARIANTS = ["KI", "Machine Learning", "Deep Learning", "Neuronaler Netze"];
    const AI_ACTION_VARIANTS = ["identifiziert", "erkannt", "gefunden", "klassifiziert", "analysiert"];
    const RELEVANCE_VARIANTS = ["relevanten", "wichtigen", "passenden"];
    const CITY_VARIANTS = ["Münster", "unserer Stadt", "die Stadt"];
    const USER_VARIANTS = ["Nutzern", "Nutzer:innen", "Nutzerinnen", "Anwendern", "Anwender:innen", "Anwenderinnen"];
    const NEEDED_VARIANTS = ["Frontendler", "Designer", "Experten", "Backendler", "Datenbankentwickler", "Tester", "Pitchschreiber", "Projektleiter"];
    const TECHSTACK_FRONTEND_VARIANTS = ["Svelte", "React", "Vue", "Angular", "Flutter", "Ionic", "Electron", "PWA"];
    const TECHSTACK_BACKEND_VARIANTS = ["FastAPI", "Flask", "Django", "Express", "Spring", "Ruby on Rails", "Laravel", "ASP.NET"];
    const TECHSTACK_DB_VARIANTS = ["Postgres", "MySQL", "MariaDB", "SQLite", "MongoDB", "CouchDB", "Redis", "Neo4j"];
    const CLOSINGS_VARIANTS = ["Super", "Nachhaltig", "Jovel", "Attraktiv", "Besser", "Sicher", "Schön", "Inspirierend", "Gesellschaftsfördernd", "Einfach", "Ressourcenschonend"];
    const TOPIC_VARIANTS = [
        "Fahrräder",
        "Giveboxen",
        "Ladesäulen",
        "Cargobikes",
        "Veranstaltungen",
        "Bäume",
        "Hunde",
        "Kinder",
        "Mobilität",
        "Blutspenden",
        "Bier",
        "Sport",
        "Klima",
        "Parkplätze",
        "Nachhaltigkeit",
        "ÖPNV",
        "Weihnachtsmärkte",
    ];

    function handleClick() {
        stichwort_output = stichwort_input;
        teamname_output = generate_teamname();
        type_output = pick_random_value_from_array(TYPE_VARIANTS);
        intent_output = pick_random_value_from_array(INTENT_VARIANTS);
        means_output = pick_random_value_from_array(MEANS_VARIANTS);
        value_output = pick_random_value_from_array(VALUE_VARIANTS);
        map_output = map_input;
        map_action_output = pick_random_value_from_array(MAP_VARIANTS);
        ai_output = ai_input;
        ai_variant_output = pick_random_value_from_array(AI_VARIANTS);
        ai_action_output = pick_random_value_from_array(AI_ACTION_VARIANTS);
        relevance_output = pick_random_value_from_array(RELEVANCE_VARIANTS);
        city_output = pick_random_value_from_array(CITY_VARIANTS);
        user_output = pick_random_value_from_array(USER_VARIANTS);
        techstack_output = generate_techstack();
        needed_output = generate_needed();
        closings_output = generate_closings();
    }

    function handleSuggest() {
        // generate a random topic
        stichwort_input = pick_random_value_from_array(TOPIC_VARIANTS);
    }

    function pick_random_value_from_array(arr) {
        // return a random variant
        let random_number = Math.random();
        return arr[Math.floor(random_number * arr.length)];
    }

    function generate_teamname() {
        let random_number = Math.random();

        if (random_number < 0.25) {
            teamname_output = stichwort_input + "ly";
        } else if (random_number < 0.5) {
            teamname_output = stichwort_input.toLowerCase().replaceAll("a", "ä").replaceAll("o", "ö").replaceAll("u", "ü");
        } else if (random_number < 0.75) {
            teamname_output = stichwort_input + "MS";
        } else {
            teamname_output = teamname_output.replaceAll("u", "oo").replaceAll("ä", "ay").replaceAll("o", "0").replaceAll(intent_output, "y");
        }

        return teamname_output;
    }

    function generate_closings() {
        let chosen_closings = [];

        // pick 3 random closings
        for (let i = 0; i < 3; i++) {
            let random_number = Math.random();
            let chosen_closing = CLOSINGS_VARIANTS[Math.floor(random_number * CLOSINGS_VARIANTS.length)];

            // make sure we don't pick the same closing twice
            while (chosen_closings.includes(chosen_closing)) {
                random_number = Math.random();
                chosen_closing = CLOSINGS_VARIANTS[Math.floor(random_number * CLOSINGS_VARIANTS.length)];
            }

            chosen_closings.push(chosen_closing);
        }

        return chosen_closings.join(". ");
    }

    function generate_needed() {
        let chosen_needed = [];
        // pick 2 random needed
        for (let i = 0; i < 2; i++) {
            let random_number = Math.random();
            let chosen_need = NEEDED_VARIANTS[Math.floor(random_number * NEEDED_VARIANTS.length)];

            // make sure we don't pick the same needed twice
            while (chosen_needed.includes(chosen_need)) {
                random_number = Math.random();
                chosen_need = NEEDED_VARIANTS[Math.floor(random_number * NEEDED_VARIANTS.length)];
            }

            // if "Expert" is chosen, add the stichwort
            if (chosen_need === "Experten") {
                chosen_need = chosen_need + " für " + stichwort_input;
            }

            chosen_needed.push(chosen_need);
        }

        return chosen_needed.join(" und ");
    }

    function generate_techstack() {
        // combine 1 frontend, 1 backend and 1 db

        // pick 1 random frontend
        let random_number = Math.random();
        let chosen_frontend = TECHSTACK_FRONTEND_VARIANTS[Math.floor(random_number * TECHSTACK_FRONTEND_VARIANTS.length)];

        // pick 1 random backend
        random_number = Math.random();
        let chosen_backend = TECHSTACK_BACKEND_VARIANTS[Math.floor(random_number * TECHSTACK_BACKEND_VARIANTS.length)];

        // pick 1 random db
        random_number = Math.random();
        let chosen_db = TECHSTACK_DB_VARIANTS[Math.floor(random_number * TECHSTACK_DB_VARIANTS.length)];

        // combine
        return chosen_frontend + ", " + chosen_backend + " und " + chosen_db;
    }
</script>

<div class="github-ribbon">
    <a target="_blank" href="https://github.com/thunfischtoast/mshack_pitch_generator">Fork me on GitHub</a>
</div>

<div>
    Lets creata a nice pitch for the <a href="https://muensterhack.de" target="_blank">Münsterhack</a>:
</div>

<hr />
<div>
    Stichwort: <input bind:value={stichwort_input} />
    <button on:click={handleSuggest}>Vorschlagen</button>
    <br />
    Karte: <input type="checkbox" bind:checked={map_input} />
    KI: <input type="checkbox" bind:checked={ai_input} />
    <br />
    <button on:click={handleClick}>Generieren</button>
</div>

<hr />
<div>
    <h3>Output</h3>
    <p>
        Hallo wir sind {teamname_output} und bei unserer {type_output} geht es um {stichwort_output}. <br />
        Wir {intent_output} durch {means_output} von {stichwort_output}
        {city_output}
        {value_output} machen. <br />
        {#if map_output}
            Man soll die {stichwort_output} auf einer Karte {map_action_output} können. <br />
        {/if}
        {#if ai_output}
            Mit Hilfe von {ai_variant_output} werden die {stichwort_output} {ai_action_output}. <br />
        {/if}
        Den {user_output} werden die für sie {relevance_output}
        {stichwort_output} angezeigt.<br />
        Unser Stack ist {techstack_output}. <br />
        Kommt zu uns: Wir brauchen noch {needed_output}. <br />
        {teamname_output}: {closings_output}.
    </p>
</div>

<style>
    .github-ribbon {
        position: absolute;
        width: 150px;
        height: 150px;
        overflow: hidden;
        z-index: 99999;
        top: 0px;
        left: 0px;
    }
    .github-ribbon a {
        display: inline-block;
        width: 200px;
        overflow: hidden;
        padding: 6px 0px;
        text-align: center;
        transform: rotate(-45deg);
        text-decoration: none;
        color: rgb(255, 255, 255);
        position: inherit;
        font: 700 13px "Helvetica Neue", Helvetica, Arial, sans-serif;
        box-shadow: rgba(0, 0, 0, 0.5) 0px 2px 3px 0px;
        background-color: rgb(170, 0, 0);
        top: 45px;
        left: -40px;
        background-image: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15));
    }
</style>
