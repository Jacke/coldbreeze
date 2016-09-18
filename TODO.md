++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
1. Process history stage tracking
How long each step was taken to pass
1 - a (b-a)
2 - b (now - b)
3 - now


2. Replace strategy function
3. Indicators REST API and page integration

---------------------------


4. Middleware extension 
Module: REST 
Function: GET POST
Params GETRequest, PostRequest

Slack extends REST
Function: PostToChannel
Params: PostToChannel(Auth headers)

5. AuthHeadersStore
6. Ref Action CUD
7. Obj page 
8. Formly preview / Load fields
9. Klass/Obj/Entity/Value CRUD
10. Link type
11. Req type
12. Migrate confirm element
13. Copy test user
14. Rename task to step
15. Promo page screenshots / Concept of workflow
16. Status of MW [Delay, REST]
17. Popups IO Indicator
18. Launch acts pagination 
19. Base fetch duration
20. Refactor DAO Builder for being easily collect resources
21. DAO Module refactor
22. Async exec
---------------------------------------------------------------------------------------------------------


--------------
- Slack action
- Mashape action
- Structure as output/input/base
- Idempotence action flag
- Secure resources
- Eliminate queries
- Unlim usage feature
- Annotation
- API Response to object
- Realtime stations
- Livemode
- Public mode(for getting feedback about something)



--------------













* Change ID to LONG everywhere
* Error ajax
http://kufli.blogspot.ru/2013/08/sprayio-rest-service-exception.html
http://plnkr.co/edit/lzYaZt?p=preview
http://www.egobrain.ru/blog/2014/02/13/obrabotka-oshibok-poumolchaniiu-angularjs/



* Blocks {
  || Process owning, viewers, access // by owning tables Employees/Clients/Firm + Groups assigns
  }




* Misc
  * Graph.js


/Final/
  * Collab & sharing
  * Observer block http://www.activiti.org/userguide/index.html#bpmnEvents
  * Triggers(that runs something just from template and request[POST /auth/token?acton=...])

* Assembled
  * BProcess returns
  * CTX[Res -> BPS]
  * FrameMarker
  * main.scala.maps.FrameLink ctx-ctx links
  ** main.scala.utils.Space || Make support for frame elements
  * Assembly Function [ Provide access to triple (object, params, arguments)] 1. req(el, in), assebmly(frame), running
  ** [* CHAIN Invoke -> Process -> Process ]
  * Return in BProcess  [ Blocks that comes after process invoked ]
  * Return in ProcElems [ Block that return blocks and arg&params ]

  * Bridge
  * Templates BP, ctx, sbj?
  * Neo4J integration?
  * Sandbox for testing external Blocks
  * Service
  * RPC
  * Zappier
  * Regressor-core
