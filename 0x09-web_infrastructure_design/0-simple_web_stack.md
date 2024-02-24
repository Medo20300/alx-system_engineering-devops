
![drawio](https://github.com/FOXAYA/alx-system_engineering-devops/assets/75582176/af5d0fa3-868b-4559-aeb0-56db798f58e9)

#Description
- This is a simple web infrastructure that hosts a website that is reachable via www.foobar.com

#What a server is.
- A server is a computer hardware or software that provides services to other computers, which are usually referred to as clients.

#The role of the domain name.
- To provide a human-friendly alias for an IP Address.
- E.X >> The domain name www.wikipedia.org is easier to recognize and remember than 91.198.174.192. The IP address and do  main name alias is mapped in the Domain Name System (DNS)

#The type of DNS record www is in www.foobar.com.
- www.foobar.com uses an A record. This can be checked by running dig www.foobar.com.
  Note: the results might be different in this design, an A record is used.
  Address Mapping record stores a hostname and its corresponding IPv4 address.

#The role of the web server.
- The web server is a software/hardware that accepts requests via HTTP or secure HTTP (HTTPS) and responds with
  the content of the requested resource or an error messsage.

# The role of the application server.
- To install, operate and host applications and associated services for end users
# The role of the database.
- To maintain a collection of organized information that can easily be accessed, managed and updated

# What the server uses to communicate with the client (computer of the user requesting the website).
- it uses TCP/IP protocol suite.

# Issues With This Infrastructure
- There are multiple SPOF (Single Point Of Failure) in this infrastructure.
- E.x >> if the MySQL database server is down, the entire site would be down.

# Downtime when maintenance needed.
- When we need to run some maintenance checks on any component, they have to be put down or the server has to be
  turned off. Since there's only one server, the website would be experiencing a downtime.

# Cannot scale if there's too much incoming traffic.
- It would be hard to scale this infrastructure becauses one server contains the required components.
 
