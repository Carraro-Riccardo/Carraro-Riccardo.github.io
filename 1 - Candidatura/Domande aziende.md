# Domande per i proponenti

## C1 Knowledge Management
1. A quanto ammonta la mole di documentazione su cui il modello deve essere in grado di rispondere? E qual è il livello di precisione della risposta voluto?
2. L'interfacciamento tra OpenAI e il vector Database come può avvenire?
3. Per quanto riguarda la "chat history" menzionata nello schema nelle slide del capitolato, per ogni utente deve essere gestita anche la possibilità di riprendere chat interrotte e più chat contemporaneamente (stile chatGPT).
4. è richiesto anche un qualche tipo di testing per il codice generato?
5. La risposta data dall'applicazione deve anche contenere immagini?

> Il capitolato si concentra molto sull'utilizzo di tecnologie moderne come l'intelligenza artificiale, offrendo spunti implementativi con finalità pratiche e di assistenza all'utente finale.


## C2 Sistema di raccomandazione
1. La creazione e l'addrestramento dei modelli richiede normalmente un dataset ampio e HW prestante (soprattutto durante la fase training). Queste componenti, in che modo verrebbero fornite?
2. Qual è il livello di complessità matematica del modello richiesto per soddisfare le richieste del capitolato?

> Il capitolato verta sull'utilizzo di modelli di apprendimento al fine di creare un sistema di raccomandazione di prodotti ideale e mirato per ogni utente. 


## C3 Easy Meal
1. Le richieste di prenotazione (da parte degli utenti) hanno un periodo oltre il quale scadono? (esempio: il ristorante deve confermare/rifiutare entro 30 minuti, al termine dei quali la richiesta è rifiutata)
2. In caso non ci fosse alcun limite di tempo di accettazione, le richieste, qualora fossero per un giorno futuro, possono essere inviate anche fuori l'orario di apertura dell'attività?
3. Esiste una casisistica riguardante il caso in cui dopo la prenotazione nessuno si presenti al locale?
4. Per la chat è necessaria cifratura end to end e anche persistenza dei dati?
5. Pensate che Flutter sia un buon framework da utilizzare per questo capitolato?

> Il capitolato è molto corposo e ben strutturato. Le richieste sono molteplici ma il tema trattato è estemamente interessante. Il prodotto risulterebbe un applicativo utile e semplice da utilizzare, con vari aspetti Social e di interazione anche con altri utenti.


## C4 Nuvolaris
1. Cosa rende Nuvolaris cosi adatto a scrivere API?
2. La documentazione è da ritenersi completa nella sua versione 0.3.0 beta attualmente disponibile?
3. Il plugin deve poter modificare la configurazione dello stack (e quindi accedere al backend Nuvolaris) anche dopo il termine della prima sessione?
4. Cosa deve succedere ogni volta che l'utente chiede la modifica di un'app? L'app esistente deve essere aggiornata oppure viene scartata in favore di una nuova istanza?

> Il capitolato si propone di ridurre, tramite IA, la barriera in ingresso per la gestione di setup di cloud computing complessi e normalmente riservati ad utenti esperti.


## C5 Magazzino 3D
1. Al fine di poter rappresentare i prodotti su ogni scaffale, le informazioni relative a dimensioni e posizionamento sono reperibili da database già popolati?
2. Il sistema di codifica in righe/colonne può essere determinato direttamente da noi o deve essere modificabile dall'utente?
3. Le scaffalature, per quanto modificabili a piacimento, devono rispettare delle misure standard o sono liberamente modificabili? (esempio: le scaffalature possono essere di 1m o 2m piuttosto che 1.37 m o misure non standard)
4. Chi è il destinatario di un'eventuale richiesta di spostamento di un prodotto da uno scaffale all'altro? Al fine dello spostamento quindi vi è una notifica che conferma lo spostamento?
5. Ai fini di sviluppo, come posso essere implementati test intensivi per un prodotto prettamente grafico? Consigliereste quale libreria o qualche approccio?
6. Per eventuali difficoltà nella modellazione 3d di alcuni elementi, è possibile chiedere un aiuto all'azienda?
7. Le corsie del magazzino devono avere delle dimensioni minime?

> Il capitolato risulta estremamente interessante. Il prodotto finale rappresente un applicativo pratico e funzionale che apre la possibilità di modernizzare la gestione e l'organizzazione di magazzi di piccole, medie e grandi dimensioni. La possibilità di lavorare con strumenti grafici 3d rende il capitolato molto affascinante e rappresenta un stimolo per ogni membro del gruppo ad impegnarsi nel suo sviluppo.


## C6 SyncCity
1. Grafana è requisito fondamentale o sono accettati anche altre piattaforme di data visualization?


## C7 ChatGPT vs BedRock
1. Non essendo in grado di accedere direttamente a github, come dovrebbe avvenire l'analisi del codice da parte di chatgpt?
2. Una volta generate le epic & user stories, come possiamo valutarne la bontà rispetto alle aspettative?
3. E' possibile ottenere maggiori informazioni riguardo l’architettura basata su microservizi e lo sviluppo dei plugin?
4. Lo sviluppo del plugin per Xcode richiede l'accesso ad una macchina MacOS. Come si può fare?


## C8 JMAP
1. Quali sono le limitazioni o i problemi con IMAP che l’azienda spera di superare con l’adozione di JMAP?
2. Come dovremmo interfacciarci poi con Carbonio per iniziare l'implementazione di JMAP?
3. Poiché i requisiti minimi per l'installazione on-premise sono significativi, sarà possibile testare l'integrazione su una versione cloud del prodotto?

> Il capitolato si propone di esplorare nuovi sviluppi nella comunicazione e-mail, probabilmente la tecnologia di comunicazione più utilizzata al mondo.

## C9 ChatSQL
1. Quali tecniche specifiche di ingegneria del prompt prevedete di utilizzare per ottimizzare le interazioni con i modelli di intelligenza artificiale? Avete già stabilito delle linee guida o delle best practice per la formulazione dei prompt?
2. La creazione e l'addrestramento dei modelli richiede normalmente un dataset ampio e HW prestante (soprattutto durante la fase training). Queste componenti, in che modo verrebbero fornite?
3. In che standard devono essere costruite le frasi SQL?
4. È possibile ricevere risorse per formarsi meglio sulla formulazione dei prompt?
