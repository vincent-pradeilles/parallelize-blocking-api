# parallelize-blocking-api

This Xcode project shows how it is possible to use `RxSiwft` to wrap a synchronous API, thus making it easy to call in an asynchronous and multi-threaded fashion.

`BlockingDAO.swift` contains a blocking data access API.
`BlockingOrchestration.swift` shows a blocking orchestration of the DAO in order to implement a higher-level service.
`AsyncDAOFacade.swift` leverages `RxSwift` to wrap the blocking DAO.
`ParallelOrchestration.swift` shows how a higher-level service can be achieved in a reactive way.