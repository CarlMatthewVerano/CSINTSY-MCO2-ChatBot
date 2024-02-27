# CSINTSY-MCO2-ChatBot

# ChatBot Expert System for Disease Diagnosis

## Overview
This Prolog-based expert system aims to assist in diagnosing diseases, especially in rural areas with limited access to healthcare. The system engages users in a dialogue to narrow down symptoms to a possible disease diagnosis.

## Diseases Covered
The expert system includes the following diseases:
- Tuberculosis
- Dengue Fever
- Measles
- Diabetes
- Stroke
- Asthma
- Diarrhea
- Pneumonia
- Leptospirosis
- Rabies

## How to Use
1. Initialize the knowledge base in SWI-Prolog.
2. Run the `go` predicate to begin the diagnostic process.
3. Answer the prompted questions regarding symptoms experienced.
4. Receive a hypothesis of the possible disease based on the knowledge base.

## Knowledge Base
The knowledge base is comprised of researched diseases and their associated symptoms, encoded into Prolog predicates and rules that guide the diagnostic process.

## Features
- Diagnosis through symptom verification
- Separation of common and uncommon symptoms
- Advice and suggestions provided upon disease identification

## Performance
The system does not require all symptoms to be present for a diagnosis, reflecting the real-world scenarios where not all symptoms are always manifested.
