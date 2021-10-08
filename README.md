saml-practice
=============

This is a small environment for practicing SAML attacks. It uses a modified
version of the example identity and service providers in Tim Heap's `timheap/flask-saml2` 
as the vulnerable services. 

Running saml-practice
---------------------

* Running sudo ./start-saml-practice.sh will build and start the Docker containers.
* Running sudo ./stop-saml-practice.sh will stop the containers

Service details
---------------

* The Identity Provider runs on http://<your ip address>:8000/
* Service Provider 0 runs on http://<your ip address>:9000/
* Service Provider 1 runs on http://<your ip address>:9001/sp1

I recommend using separate browsers or a regular browser window and an 
incognito window to access the two service providers, so as not to have cookie
issues.

SAML Vulnerabilities
--------------------

The services are vulnerable to SAML responses with no certificates, SAML 
Responses with self-signed certificates, and SAML responses that do not check
the Audience condition.

