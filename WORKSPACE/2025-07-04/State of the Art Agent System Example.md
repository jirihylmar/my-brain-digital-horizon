# State of the Art Agent System Example

## Test Search On Web

python3 /home/hylmarj/inicom/compyt/f_open_browsers_with_phrases.py /home/hylmarj/my-brain-digital-horizon/WORKSPACE/2025-07-04/questions.txt

## Trusted Resources

https://www.scopus.com/search/form.uri?display=basic#basic
https://www.webofscience.com/wos/woscc/basic-search
https://ieeexplore.ieee.org/Xplorehelp/overview-of-ieee-xplore/about-ieee-xplore
https://www.sciencedirect.com/

## Other resources

https://www.mdpi.com/about


## State of the Art Agent System Example

Clarivate Launches Generative AI-Powered Web of Science Research Assistant
https://www.prnewswire.com/news-releases/clarivate-launches-generative-ai-powered-web-of-science-research-assistant-302236894.html

News provided by
Clarivate Plc 
Sep 04, 2024, 03:00 ET

Clarivate AI

How do the LLMs get their training data?
We use commercially provided pre-trained Large Language Models in a Retrieval Augmented Generation architecture (RAG). We do not train our own models. While we are using the pre-trained LLMs to support the creation of narrative content, the facts in this content are generated from our trusted academic sources. We test this setup rigorously to ensure academic integrity and alignment with the academic ecosystem. Testing includes validation of responses through academic subject matter experts who evaluate the outputs for accuracy and relevance. Additionally, we conduct extensive user testing that involve real-world research and learning scenarios to further refine accuracy and performance.

We are committed to the highest standards of user privacy and security. We do not share or pass any publisher content, library-owned materials, or user data to large language models (LLMs) for any purpose.

https://clarivate.com/academia-government/scientific-and-academic-research/research-discovery-and-referencing/web-of-science/web-of-science-research-assistant/


Introducing the Clarivate Academic AI Platform
https://clarivate.com/academia-government/blog/introducing-the-clarivate-academic-ai-platform/?campaignname=WoS_RA_LeadGen_AG_Global_2024&campaignid=701QO00000Cid5BYAR&utm_campaign=WoS_RA_LeadGen_AG_Global_2024&utm_source=Press_Release&utm_medium=Earned_Press

Clarivate Academic AI
https://clarivate.com/ai/academia/?campaignname=PR_LeadGen_XBU_Global_2024&campaignid=701KY000000DGx2YAG&utm_campaign=PR_LeadGen_XBU_Global_2024&utm_source=Blog&utm_medium=Owned_Press


https://clarivate.com/academia-government/blog/web-of-science-research-assistant-elevates-discovery-with-responsible-ai/
Web of Science Research Assistant elevates discovery with responsible AI


Web of Science Research Assistant
https://webofscience.zendesk.com/hc/en-us/articles/31437630410129-Web-of-Science-Research-Assistant#h_01JGKZG2P1XN9FWQGW98CKWB18


### Example Workflow

1. Research assistant, understanding the topis

https://www.webofscience.com/wos/research-assistant/99bfcb21-1648-41f9-a29e-dcd09cfb8c1a

- I am going to walk you through understanding a topic. What is your topic of interest or research question?
- Load Monitoring and Appliance Recognition Using an Inexpensive, Low-Frequency, Data-to-Image, Neural Network, and Network Mobility Approach for Domestic IoT Systems

- Articles, citations, ratings, graphs

2. Retrieve the single article record metadata entry

https://www.webofscience.com/wos/woscc/full-record/WOS:000573846400010

3. Go to published paper (is this case sciencedirect)

https://www.sciencedirect.com/science/article/pii/S2210670720306326#tbl0025

Download PDF article.
Download citation

4. Standardize citation using assistant https://claude.ai/project/ff72ed33-90a0-48ec-ae0d-7d2817138a67

```bibtex
@article{GOPINATH2020102411,
title = {Energy management using non-intrusive load monitoring techniques – State-of-the-art and future research directions},
journal = {Sustainable Cities and Society},
volume = {62},
pages = {102411},
year = {2020},
issn = {2210-6707},
doi = {https://doi.org/10.1016/j.scs.2020.102411},
url = {https://www.sciencedirect.com/science/article/pii/S2210670720306326},
author = {R. Gopinath and Mukesh Kumar and C. {Prakash Chandra Joshua} and Kota Srinivas},
keywords = {Energy management, Non-intrusive load monitoring (NILM), Machine learning and deep learning, Event detection, Load classification, Energy disaggregation},
abstract = {In recent years, the development of smart sustainable cities has become the primary focus among urban planners and policy makers to make responsible use of resources, conserve the environment and improve the well-being of the society. Energy management is an integral part of the smart sustainable cities development programme which involves conscious and efficient use of available energy resources towards attaining sustainability and self-reliance on energy systems. Building sector is one of the key sectors that utilize more energy. Therefore, efforts are being made to monitor and manage energy consumption effectively in residential and commercial buildings. In recent years, non-intrusive load monitoring (NILM) technique has become a popular and emerging approach to monitor events (on/off) and energy consumption of appliances/electrical utilities in buildings using single energy meter. The information about the energy consumption at the appliance level would help consumers to understand their appliance usage behavior and take necessary steps for reducing energy consumption. In this paper, we present the comprehensive review of state-of-the-art algorithms that have been explored by the researchers towards developing an accurate NILM system for effective energy management. Finally, potential applications of NILM in different domains and its future research directions are discussed.}
}
```

```bibtex
@article{energy-management-using-non-intrusive-load-monitoring-techniques-state-of-the-art-and-future-research-directions,
	title               = {Energy management using non-intrusive load monitoring techniques – State-of-the-art and future research directions},
	comment-content     = {This paper presents a comprehensive review of state-of-the-art algorithms for non-intrusive load monitoring (NILM) systems that are used for effective energy management in buildings. NILM is described as a popular emerging approach to monitor events and energy consumption of appliances using a single energy meter. The paper discusses how information about appliance-level energy consumption can help consumers understand their usage behavior and take steps to reduce energy consumption. The authors review various algorithms explored for developing accurate NILM systems and discuss potential applications in different domains along with future research directions. Claude 3.7 Sonnet, AI asistent.},
	comment-abstract    = {placeholderCommentAbstract},
	comment-authorize   = {hylmarj, publicuser},
	author              = {R. Gopinath and Mukesh Kumar and C. {Prakash Chandra Joshua} and Kota Srinivas},
	journal             = {Sustainable Cities and Society},
	volume              = {62},
	pages               = {102411},
	year                = {2020},
	issn                = {2210-6707},
	doi                 = {https://doi.org/10.1016/j.scs.2020.102411},
	url                 = {https://www.sciencedirect.com/science/article/pii/S2210670720306326},
	keywords            = {energy management, non-intrusive load monitoring, NILM, machine learning, deep learning, event detection, load classification, energy disaggregation, smart sustainable cities, building energy},
	abstract            = {In recent years, the development of smart sustainable cities has become the primary focus among urban planners and policy makers to make responsible use of resources, conserve the environment and improve the well-being of the society. Energy management is an integral part of the smart sustainable cities development programme which involves conscious and efficient use of available energy resources towards attaining sustainability and self-reliance on energy systems. Building sector is one of the key sectors that utilize more energy. Therefore, efforts are being made to monitor and manage energy consumption effectively in residential and commercial buildings. In recent years, non-intrusive load monitoring (NILM) technique has become a popular and emerging approach to monitor events (on/off) and energy consumption of appliances/electrical utilities in buildings using single energy meter. The information about the energy consumption at the appliance level would help consumers to understand their appliance usage behavior and take necessary steps for reducing energy consumption. In this paper, we present the comprehensive review of state-of-the-art algorithms that have been explored by the researchers towards developing an accurate NILM system for effective energy management. Finally, potential applications of NILM in different domains and its future research directions are discussed.}
}
```

5. Add citation to the central bibtex

6. Use tools to convert to text, save all to catalogue and upload to knowledge base
