논의사항
- 실제 작업하고 있는 제품은 Layering이 어떻게 되어있으신가요? 잘 적용되는지, 겹쳐져 있는지, 궁금합니다. 

**Chapter 1: Layering**



* **Layering is a powerful technique for managing complexity in enterprise applications.** By dividing the system into distinct layers, each with specific responsibilities, layering improves modularity, understandability, and maintainability.
* **The three-layer architecture is the most common approach for enterprise applications:**
    * **Presentation Layer:** Handles user interaction and display.
    * **Domain Layer:** Encapsulates the core business logic.
    * **Data Source Layer:** Manages communication with databases and other external systems.
* **Dependencies between layers should be carefully managed.** The domain and data source layers should not depend on the presentation layer, allowing for easier modification and substitution of different presentations.
* **Choosing where to run each layer (client vs. server) involves trade-offs.** Running everything on the server is often preferred for ease of maintenance, but responsiveness and disconnected operation may necessitate running some logic on the client.
* **While layering offers many benefits, potential drawbacks should be considered.** These include the possibility of cascading changes across layers and performance overhead due to data transformations between layers.

**Overall, Chapter 1 emphasizes the importance of layering as a fundamental architectural pattern for enterprise applications and provides valuable guidance on applying it effectively.**

**Chapter 2: Organizing Domain Logic**



* **Three main patterns exist for organizing domain logic:**
    * **Transaction Script:** Simple and procedural, suitable for applications with straightforward business logic.
    * **Domain Model:** Object-oriented and expressive, ideal for managing complex logic and reducing duplication.
    * **Table Module:** A middle ground between the two, offering better structure than Transaction Script and easier database mapping than Domain Model.
* **Choosing the right pattern depends on the complexity of the business logic.** For simple logic, Transaction Script is often sufficient. As complexity increases, Domain Model becomes more attractive. Table Module can be a good compromise in certain situations, particularly with tools that support Record Set data structures.
* **The Service Layer provides a facade over the domain logic and handles application-specific concerns.** This layer offers a clean API, centralizes transaction control and security, and promotes reusability of domain logic.
* **It is recommended to use a thin Service Layer and focus on domain logic within the Domain Model.** This approach maximizes the benefits of object-oriented design and avoids duplication of logic.

**Overall, Chapter 2 emphasizes the importance of choosing the appropriate pattern for organizing domain logic based on the complexity of the application and highlights the benefits of using a Service Layer to decouple domain logic from other concerns.**

**Chapter 3: Mapping to Relational Databases**



* **Object-relational mapping is a complex task due to the inherent differences between object-oriented and relational models.** This chapter provides a comprehensive set of patterns to address these complexities.
* **Data Source Architectural Patterns define how domain logic interacts with the database:**
    * **Table Data Gateway and Row Data Gateway:** Encapsulate SQL access and separate it from domain logic.
    * **Active Record:** Combines data access and domain logic within domain objects, suitable for simple models.
    * **Data Mapper:** Isolates domain objects from the database by handling all mapping logic in a separate layer, suitable for complex models.
* **Behavioral patterns address the challenges of loading, saving, and managing concurrency:**
    * **Unit of Work:** Tracks changes and coordinates database interactions within a business transaction.
    * **Identity Map:** Ensures each object is loaded only once and maintains identity.
    * **Lazy Load:** Optimizes data access by loading related objects only when needed.
* **Structural mapping patterns address the differences in how objects and relational databases represent data:**
    * **Identity Field:** Stores the database primary key in an object to maintain identity.
    * **Foreign Key Mapping:** Maps object associations to foreign key references in tables.
    * **Association Table Mapping:** Uses a separate table to represent many-to-many associations.
    * **Dependent Mapping:** Simplifies mapping for child objects accessed through their parent.
    * **Embedded Value:** Maps small value objects as fields within the owner object's table.
    * **Serialized LOB:** Stores a complex object graph as a single large object in the database.
    * **Inheritance Mapping Patterns:** Different strategies for mapping inheritance hierarchies to relational tables.
* **Metadata Mapping can reduce repetitive code by storing mapping information in metadata.** This approach can be implemented using code generation or reflective programming.

**Overall, Chapter 3 provides a rich toolbox of patterns and techniques for effectively managing the complexities of object-relational mapping in enterprise applications.**

**Chapter 4: Web Presentation**



* **Model View Controller (MVC) is a crucial pattern for structuring web UIs.** It separates presentation from domain logic, improving modularity, testability, and flexibility.
* **Separation of presentation and model is essential.** This allows for multiple presentations of the same model and simplifies testing of domain logic.
* **Separation of view and controller is less critical but can be useful in certain situations.** For example, it can support different behaviors for editable and non-editable views.
* **View patterns handle the rendering of model data into HTML:**
    * **Template View:** Embeds markers in a static HTML page to be replaced with dynamic content.
    * **Transform View:** Transforms domain data element by element into HTML.
    * **Two Step View:** Transforms data into a logical presentation first, then renders it into HTML, useful for consistent look and feel or multiple appearances.
* **Input controller patterns handle user requests and interact with the model and view:**
    * **Page Controller:** Handles requests for specific pages or actions.
    * **Front Controller:** A single controller handles all requests, allowing for centralized logic and dynamic behavior modification.

**Overall, Chapter 4 emphasizes the importance of applying MVC and related patterns to design well-structured and maintainable web UIs for enterprise applications.**

**Chapter 5: Concurrency**



* **Concurrency is a complex issue in software development, but transaction managers can alleviate many problems in enterprise applications.** Transactions provide a framework for ensuring data consistency and preventing conflicts.
* **Two essential concurrency problems exist:**
    * **Lost Updates:** When one user's changes overwrite another's.
    * **Inconsistent Reads:** When a user reads partially updated or inconsistent data.
* **Isolation and immutability are key techniques for managing concurrency:**
    * **Isolation:** Ensures only one active agent can access data at a time.
    * **Immutability:** Eliminates the need for concurrency control by identifying data that cannot be changed.
* **Optimistic and pessimistic concurrency control offer different trade-offs:**
    * **Optimistic:** Detects conflicts at commit time and rolls back transactions, suitable for low conflict scenarios.
    * **Pessimistic:** Prevents conflicts by acquiring locks before accessing data, suitable for high conflict scenarios.
* **Business transactions often span multiple system transactions, requiring specific concurrency control patterns:**
    * **Optimistic Offline Lock:** Applies optimistic concurrency control across business transactions.
    * **Pessimistic Offline Lock:** Uses pessimistic locking to prevent conflicts between business transactions.
* **Application server concurrency requires careful management to avoid multithreading issues.** Process-per-request or thread-per-request approaches can help minimize the need for explicit synchronization and locks.

**Overall, Chapter 5 provides a comprehensive overview of concurrency challenges and solutions in enterprise applications, emphasizing the importance of choosing the appropriate concurrency control mechanisms and patterns based on the specific needs of the system.**

**Chapter 6: Session State**



* **Session state refers to data relevant only to a specific user session, distinct from persistent record data.** Managing session state effectively is crucial for many enterprise applications, particularly web-based systems.
* **Stateless servers offer significant advantages in terms of resource usage and scalability.** However, many client interactions are inherently stateful, requiring appropriate state management solutions.
* **Session state has ACID properties and requires careful handling to ensure isolation and consistency.** This is particularly important when data is accessed and modified across multiple system transactions within a business transaction.
* **Three main options exist for storing session state:**
    * **Client Session State:** Stores data on the client-side, suitable for small amounts of data but raises security and bandwidth concerns.
    * **Server Session State:** Stores data on the server-side, either in memory or serialized on disk or database, offering a balance between performance and scalability.
    * **Database Session State:** Stores session data as committed data in the database, requiring careful separation from record data and potentially impacting performance.
* **Choosing the best approach depends on various factors, including the amount of data, security requirements, clustering needs, performance considerations, and development effort.** Server Session State is often preferred for its simplicity and efficiency, while Database Session State may be suitable for high-traffic systems with low session data volume.

**Overall, Chapter 6 provides a clear understanding of session state management options and their trade-offs, enabling architects and developers to choose the most appropriate approach for their specific application needs.**

**Chapter 7: Distribution Strategies**



* **Distributing objects in enterprise applications can be tempting but often introduces significant complexities and performance penalties.** The cost of remote calls is much higher than local calls, and remote interfaces require a coarser-grained design, impacting flexibility and maintainability.
* **The First Law of Distributed Object Design: Don't distribute your objects!** Clustering, where multiple copies of the same application run on different nodes, is often a better approach for utilizing multiple processors and achieving scalability.
* **Distribution is sometimes unavoidable, such as in client-server applications or when integrating with vendor packages.** In these cases, it's crucial to carefully manage the distribution boundary and minimize the number of remote calls.
* **Remote Facade and Data Transfer Object patterns help manage distribution efficiently:**
    * **Remote Facade:** Provides a coarse-grained facade over fine-grained objects, minimizing remote calls while maintaining a flexible internal design.
    * **Data Transfer Object:** Carries data efficiently between processes, reducing the number of method calls needed.
* **XML-based interfaces over HTTP (e.g., SOAP) offer advantages for data transfer and platform interoperability.** They can be used directly or layered over object-oriented interfaces to combine the benefits of both approaches.

**Overall, Chapter 7 emphasizes the importance of carefully considering distribution strategies and applying appropriate patterns to minimize the complexities and performance costs associated with distributed object systems.**

**Chapter 8: Putting It All Together**



* **This chapter provides a roadmap for designing enterprise applications using the patterns discussed in the book.** It offers a synthesis of the key decision points and recommendations for different scenarios.
* **The complexity of the domain logic is a primary driver for choosing the domain layer pattern:**
    * **Simple logic:** Transaction Script may suffice.
    * **Complex logic:** Domain Model is preferred.
    * **Middle ground:** Table Module can be a good compromise.
* **Data source patterns are chosen based on the selected domain logic pattern:**
    * **Transaction Script:** Row Data Gateway or Table Data Gateway.
    * **Table Module:** Table Data Gateway.
    * **Domain Model:** Active Record for simple models, Data Mapper for complex models.
* **Web presentation patterns follow the Model View Controller (MVC) pattern:**
    * **View:** Template View or Transform View, with Two Step View as an option for specific needs.
    * **Input Controller:** Page Controller for simpler navigation, Front Controller for more complex scenarios.
* **Technology-specific advice is offered for Java and .NET platforms, considering their common tools and frameworks.**
* **Alternative layering schemes exist and can be mapped to the patterns presented in the book.** Understanding these different schemes can provide additional insights and options for architects and developers.

**Overall, Chapter 8 serves as a practical guide for applying the patterns in the book to design and build robust, scalable, and maintainable enterprise applications.**
