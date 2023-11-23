### Book
- id
- title
### Book Author
- book_id
- author_id
### Author
- id
- name
### Category
- id
- title
- category_id
### Book Category
- book_id
- category_id
### Publisher
- id
- name
- location
### Book Copy
- id
- year_published
- book_id
- publisher_id
### Member
- id
- name
### Borrowing
- member_id
- return_date
- borrow_date
- has_been_returned

## Conceptual Schema

### Entities
- Book
- Author
- Category
- Publisher
- Book Copy
- Member
- Borrowing

### Relationships
- A Book can be written by several authors
- An author can write several Books
- A Book is published by one Publisher
- A Pubisher can publish several books
- Members can borrow several Books

### Attributes
- Book
    - id
    - title
- Book Author
    - book_id
    - author_id
- Author
    - id
    - name
- Category
    - id
    - title
- Book Category
    - book_id
    - category_id
- Publisher
    - id
    - name
    - location
- Book Copy
    - id
    - year_published
    - book_id
    - publisher_id
- Member
    - id
    - name
- Borrowing
    - member_id
    - return_date
    - borrow_date
    - has_been_returned


## SQL
```sql
CREATE TABLE AUTHOR (
    AuthorID INTEGER PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE CATEGORY (
    CategoryID INTEGER PRIMARY KEY,
    Title VARCHAR(255)
);

CREATE TABLE PUBLISHER (
    PublisherID INTEGER PRIMARY KEY, 
    Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE BORROWING (
    BorrowingID INTEGER PRIMARY KEY,
    MemberID INTEGER,
    ReturnDate TIMESTAMP,
    BorrowDate TIMESTAMP,
    HasBeenReturned BOOLEAN
);

CREATE TABLE MEMBER (
    MemberID INTEGER PRIMARY KEY,
    Name VARCHAR(255),
    BorrowingID INT REFERENCES BORROWING(BorrowingID)
);

CREATE TABLE Book (
    BookID INTEGER PRIMARY KEY,
    Isbn VARCHAR(255),
    Title VARCHAR(255),
    CategoryID INT REFERENCES CATEGORY(CategoryID),
    PublisherID INT REFERENCES PUBLISHER(PublisherID)
);

CREATE TABLE BOOKAUTHOR (
    BookID INT REFERENCES Book(BookID),
    AuthorID INT REFERENCES AUTHOR(AuthorID),
    UNIQUE (BookID, AuthorID)
);

CREATE TABLE BOOKCOPY (
    BookCopyID INTEGER PRIMARY KEY,
    YearPublished INTEGER,
    PublisherID INT REFERENCES PUBLISHER(PublisherID),
    BookID INT REFERENCES Book(BookID)
);
```
