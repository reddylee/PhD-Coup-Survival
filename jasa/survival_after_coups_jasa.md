---
title: "Political Leadership Survival in the Aftermath of Coups and Overstays: From Illegitimate Ascent to Unexpected Exit"
format:
  jasa-pdf:
    keep-tex: true  
    linestretch: 1.75
    papersize: A4
    indent: true
    number-sections: true
    keywords: [Political survival, Coups, Overstays]
    keep-md: true

date: last-modified
author:
  - name: Zhu Qi
    affiliations:
      - name: University of Essex
        department: Department of Government
  
abstract: |
 This paper delves into the duration of political leaders' tenures, focusing on two specific categories: leaders who come into power through coups and those who exceed their designated term limits. It argues that the length of political leadership tenures is not solely determined by their governing strategies but also by the means through which they ascend to power. By employing a survival model, this study demonstrates that leaders who surpass their term limits generally have longer tenures compared to those entering through coups.

bibliography: survival.bib
mainfont: Times New Roman
fontsize: 12pt
execute: 
  freeze: auto
  echo: false
  warning: false
  message: false
---


::: {.cell}

:::



## Introduction

The investigation into the enduring tenure of certain leaders compared to those with briefer terms has remained a focal point within the realm of political science.
This probing inquiry has garnered extensive attention and undergone thorough analysis across numerous scholarly works, as highlighted in Chapter 2.

Prior research examining the longevity of political leaders has highlighted two prominent features.
Firstly, scholars have primarily concentrated on general frameworks that encompass either all regime types or all autocracies, dedicating less attention to the exploration of specific leader profiles.
Secondly, existing studies have predominantly revolved around analyzing the probability of irregular leader exits using country-year data, leaving a void in discussions regarding the duration of leadership tenures based on comprehensive duration data.

Due to these significant gaps, this paper aims to conduct a comparative analysis between two specific types of political leaders: those who rise to power through coups and those who exceed their designated term limits.
Examining the tenures of these two irregularly ascended leaders holds particular significance for two reasons.

Firstly, irregularly ascended leaders constitute the majority of irregular exits from power.
According to [@goemans2009], between 1945 and 2015, among 1472 leaders who assumed office through regular channels, around 213 exited irregularly (about 14.5%).
Conversely, out of 308 leaders who assumed office through irregular means, roughly 158 (about 51.3%) experienced irregular exits.
Secondly, among irregularly ascended leaders, the majority gained power through coups or overstays.
As per [@goemans2009], out of 374 leaders who exited irregularly, 246 were ousted through coups, constituting 65.8% of these cases.
Accordingly, there are 246 coup-entry leaders.
Moreover, between 1945 and 2020, there were 106 attempts to overstay in power, of which 86 were successful.
This overstaying, detailed in "Determinants of Incumbent Overstay Attempts and Outcomes," can be perceived as a form of self-coup, as incumbents orchestrate tactics to prolong their rule, effectively staging coups against potential future leaders.
Hence, it becomes both relevant and enlightening to delve into and compare the tenures of survival between coup-entry leaders and overstaying (self-coup) leaders.

However, while existing research extensively delves into the factors leading to coups or overstays, there remains a crucial need for more attention directed towards what occurs after these irregular ascents.
Specifically, how do leaders' methods of entering power affect not only their subsequent tenures but also their departures from power?
This study proposes that the manner in which leaders ascend to power significantly impacts the duration of their leadership tenure.
Unlike leaders who overstay, those who enter through coups face more substantial challenges concerning legitimacy, uncertainty, instability, and power-sharing, potentially diminishing their survival duration.




::: {.cell}

:::

::: {.cell layout-align="center"}
::: {.cell-output-display}
![Kaplan-Meier plot](survival_after_coups_jasa_files/figure-pdf/fig-logrank-1.pdf){#fig-logrank fig-align='center'}
:::
:::


Utilizing a survival model, this paper suggests that leaders who surpass their term limits generally enjoy longer tenures compared to those who come into power through coups.
Conducting a log-rank test in survival analysis on the leaders dataset [@goemans2009] and the author's incumbent overstay dataset reveals a distinct contrast: overstay leaders demonstrate notably extended survival rates in comparison to coup-entry leaders.
Specifically, according to @fig-logrank, the average survival time post-overstay, excluding their original term duration, is approximately 10.3 years.
In contrast, leaders who gain power via coups tend to have an average survival time of 5.3 years, representing an average shortfall of 5 years in their tenure [^1].

[^1]: The data excluded leaders who survived less than 180 days.

This study could offer dual contributions.
First, it emphasizes that the duration of survival and unexpected exits is not solely dictated by leaders' conduct after assuming power but is fundamentally shaped by their methods of gaining power.
It accentuates a significant difference in tenures between overstaying leaders and coup-entry leaders.
Second, it provides empirical measurements to compare the tenure duration of these two irregularly ascended leaders, offering insights into their distinct impacts on the longevity of leadership.

After the introduction, the second section encompasses a comprehensive literature review on political survival and highlighting the contributions of this paper might offer.
The third chapter delves into the examination of factors influencing the survival of leaders who have ascended to power through unconstitutional means.
Chapter 4 provides an account of the methodology and data employed, utilizing a survival model for a comprehensive analysis of the determinants of leaders' survival.
Chapter 5 presents the findings of this analysis, facilitating an in-depth discussion of the results.
Finally, in Chapter 6, the paper concludes by synthesizing these findings and exploring their broader implications.

## Literature review: The dynamics of leadership survival in different scenarios

In their seminal work, @buenodemesquita2003 conducted a comprehensive examination of leaders spanning diverse political landscapes, encompassing democracies and autocracies, as well as parliamentary and presidential systems, while accounting for both civilian and military contexts.
Their aim was to provide an general explanation for the dynamics of political leadership survival within a universal framework.
Proposing a universal theoretical framework regarding the political survival is highly intriguing.
However, it is crucial to acknowledge the challenges that must be addressed in order to provide a more general theory of leadership survival across all types of regimes.

First of all, the rules governing power transitions differ drastically between democracies and autocracies.
In most autocratic regimes, the process of leadership selection remains shrouded in secrecy.
Expressing dissenting views, whether as potential challengers or supporters of challengers, can be perilous.
In Russia, despite the presence of general elections, challengers frequently face severe consequences such as assassination, poisoning, imprisonment, or exile.
Due to the lack of transparent and fair conventional procedures for power transitions, it's challenging to assess who holds more power or has more supporters.
A dictator could potentially survive a lengthy tenure despite weak support because the true balance of power remains undisclosed.
Conversely, a powerful ruler could be ousted by a small number of guards because the army or other supporters hesitate to fight for them due to a lack of information regarding their predominant status in the power balance.
Thus, accurately calculating selectorates or coalitions, as @buenodemesquita2003 did in their research, becomes impossible in such scenarios.
In contrast, in democracies, challengers can openly vie for leadership without fear.
Their support rates are easily discernible, and they can seek to gain more supporters through public speeches, TV or newspaper advertisements, or assemblies.
If their support rates are not adequate to challenge the incumbents, different groups can try to collaborate, facilitating power transitions with a slightly higher level of support.

Secondly, the division of residents into different coalitions or groups may not hold as much relevance in democracies when compared to autocracies.
In democratic systems, while those who support and vote for incumbents may witness their advocated policies enacted, those opposing them still experience the same policies.
For instance, if a candidate advocating for lower taxes wins an election, it doesn't lead to lower taxes for the elected leaders' supporters and higher taxes for their opponents; both groups encounter identical tax levels.
This dynamic differs significantly in autocratic regimes, where distinct groups benefit unequally based on their status and relationships with the rulers.

Furthermore, our interest in analyzing political survival stems from irregular and unforeseen power transitions.
Discussing regular and expected leadership tenures is neither necessary nor pertinent in this context.
As previously mentioned, over 85% of leaders entering power through regular means also exited in a regular manner [@goemans2009].
Many political leaders, especially in democracies and some autocracies, experience predictable and routine tenures.
Consider the case of the United States, where presidents can serve up to eight years if re-elected for a second term, or at least complete a full four-year term despite underperformance.
Similarly, in autocratic Mexico from 1919 to 2000, each president served a fixed six-year term without facing overthrows or overstays, as noted by [@klesner2019].
Analyzing the survival of such leaders might seem futile as their power transitions typically occur within the bounds of constitutional rules.

On the other hand, leaders who come into power through irregular means paint a more intricate and unpredictable picture.
Take, for instance, Henri Namphy, who assumed the presidency of Haiti following a coup in June 1988, only to be ousted by another coup a mere three months later in September of the same year.
However, Qaddafi, the dictator of Libya, seized power in a coup in 1969 and ruled for over 40 years before being killed in 2011 by NATO-backed rebel forces [@goemans2009].
Certain dictators maintain an indefinite grip on power until their death, subsequently transferring authority to family members, such as sons in the cases of Syria and North Korea or brothers in the context of Cuba.

Given the distinct nature of political leadership survival in various regimes, scholars have increasingly focused on understanding the survival dynamics specific to certain regime types, such as democracies [@svolik2014] and autocracies [@davenport2021].
Notably, considerable academic attention has been drawn towards unexpected tenures, particularly those leaders who either fail to complete their original terms or overstay their terms.
Scholars have predominantly revolved around two primary dimensions.
The first dimension encompasses contextual conditions and resources available to leaders.
These factors include elements such as the leaders' personal competence [@yu2016], societal stability [@arriola2009], economic development level [@palmer1999; @williams2011], access to natural resources [@smith2004; @quirozflores2012], and external support networks [@licht2009; @wright2008; @thyne2017].
The second dimension delves into the strategies implemented by leaders in enacting their political and economic policies.
This includes their responses to challengers and dissent within their regimes [@escribà-folch2013; @davenport2021], as well as strategies used in policy-making [@gandhi2007; @morrison2009].

Unsurprisingly, a considerable focus in previous studies has been directed towards coups, given their status as a prominent pathway leading to the exit of authoritarian leaders [@svolik2008; @frantz2016].
Literature on leadership survival has examined strategies aimed at preventing coups [@powell2017; @sudduth2017; @debruin2020], as well as analyses of how leaders extend their tenures post-surviving failed coup attempts [@easton2018].
For instance, @sudduth2017a, while primarily focused on purge strategies, examines the post-coup actions of a dictator.
The central argument suggests that leaders ascending through coups experience a temporary surge in influence compared to elites immediately following the coups, making them less prone to subsequent ousting by coup attempts.
This argument challenges the traditional notion that new leaders are generally in a weak position at the start of their tenure [@roessler2011].
Despite this distinction, both Sudduth and prior scholars concur that new leaders tend to purge rival elite groups to consolidate their power.
Sudduth argues that dictators undertake purges when they can do so without significant risk, while traditional views suggest purges occur when dictators perceive imminent threats.
However, it's imperative to acknowledge that new leaders, particularly those ascending through unconventional means, don't adhere to a universal pattern of inherent weakness or strength.
Leadership transitions unfold in varied contexts, presenting leaders with diverse challenges.

Scholars have extensively analyzed the endurance of political leaders across various spheres, examining universal frameworks, autocratic regimes, and the aftermath of failed challenges, including coup attempts.
However, there remains a notable gap in discussions surrounding the survival dynamics of leaders who consolidate power after successful coups or prolonged incumbency.
Specifically, there has been limited exploration and comparison of the survival tenures between overstay leaders and coup-entry leaders.
This study seeks to address this gap by scrutinizing and outlining the duration of survival among these two distinct categories of leaders.

## Political survival dynamics of overstay and coup-entry leaders

In this paper, I maintain the definition of "overstay" as delineated in my earlier paper, "Determinants of Incumbent Overstay Attempts and Outcomes", referring to situations where incumbent political leaders strive to exceed the maximum time permitted by constitutional norms or unwritten customs.
A successful overstay is determined by an extension of power lasting at least six months or longer.

Regarding the definition of a "coup", I will adopt the definition outlined by Powell and Thyne: coups are characterized as "illegal and overt attempts by the military or other elites within the state apparatus to unseat the sitting executive" [@powell2011, p252].
They categorize a coup attempt as successful if the perpetrators seize and retain power for a minimum of seven days.
To align with the successful overstays discussed in this paper, I will focus on instances where the usurpation of power endures for at least six months.

Engaging in discussions on the survival strategies employed by political leaders in non-democratic systems presents a considerable challenge.
This challenge is rooted in the intricate nature of power transitions within autocratic regimes, which lack a consistent and universally applicable pattern or set of conventions.
In specific instances, such as Middle Eastern monarchies, the transfer of power doesn't strictly adhere to a hereditary father-to-son lineage, further complicating the landscape.
Moreover, even if there are established rules governing power transitions, they are often flouted by incumbents or coup leaders.

Nevertheless, amidst the diversity in regime types and leadership styles, leaders who prolong their rule through self-coups and those who seize power through coups exhibit certain similarities.
Understanding these shared tactics provides insight into their strategies for survival.

The first aspect concerns the issue of legitimacy.
Leaders who ascend through coups lack legitimacy as they seize power through force or other unconventional means.
While many leaders prolong their tenures through a façade of constitutional procedures, such as judgments by the Supreme Court, congressional votes, or even referendums, they often manipulate these processes to maintain control.
It's commonly understood by ruling elites, opposition parties, and the populace that these leaders lack legitimacy.
This lack of legitimacy can sometimes justify the cause of those seeking their replacement, even if the means used are unconstitutional.

The second characteristic revolves around the uncertainty surrounding power transitions.
This uncertainty creates ambiguity not only for ruling elites and ordinary citizens but also for the leaders themselves regarding when, how, and to whom power might be transferred.
Such uncertainty breeds inherent instability.
Amidst such instability, people experience a lack of security.
This perception often leads to the belief that the current ruler is incompetent and should be replaced by someone more powerful or capable.
Consequently, the ruling elite or opposition factions may exploit the instability as an opportunity to challenge existing power structures.

The third aspect revolves around the equilibrium of power.
In autocracies, governance typically rests with a minority faction that possesses a highly structured organization, distinctly contrasting with the decentralized and disorganized subjects.
Even amid protests or uprisings, ruling groups adeptly suppress such incidents individually.
The possibility of overthrowing tyranny arises if the subjects can coalesce their efforts.
However, the principal obstacle lies in the formidable challenge of surmounting the collective action problem.
Autocratic dictators commonly adopt a ruling strategy focused on preventing unity among subjects and complicating endeavors to address collective action issues.
This elucidates why dictatorships curtail free expression, assembly, and association.
The absence of free public expression and association renders the power balance unclear.
Consequently, rulers maintain relative power advantages over not only the elites but also the subjects.

The convergence of illegitimacy, uncertainty, and power equilibrium, as highlighted in @tbl-aspects, significantly influences the lifespan of a regime.
However, when juxtaposed with leaders who seize power through coups, those who overextend their terms enjoy a relatively favorable position across these three facets.

| **Aspect**                       | **Overstay (Self-coup) Leaders**                                                                                    | **Coup-Entry Leaders**                                                                                                                                               |
|------------------|----------------------------|--------------------------------|
| Legitimacy                       | Normally attained through lawful procedures, but lacking recognized legitimacy.                                     | Attained unlawfully, devoid of legitimacy.                                                                                                                           |
| Uncertainty in Power Transitions | Initially stable; uncertainty grows with prolonged tenure, especially without designated successors as leaders age. | Significant uncertainty initially; stability emerges as power is consolidated, yet prolonged leadership poses similar challenges as overstay, fostering instability. |
| Power Sharing                    | Fewer challenges in power equilibrium due to successful overstay.                                                   | Confront power-sharing issues promised during coup staging, potentially triggering dissatisfaction among supporters if agreements are unmet.                         |

: Key Distinctions in Survival Tenures: Overstay versus Coup-Entry Leaders {#tbl-aspects .striped}

### Legitimacy

The essence of a coup inherently lacks legitimacy, categorized as "illegal" due to its abrupt and unconstitutional nature.
Successful coups act as a catalyst, publicly showcasing alternative, non-constitutional pathways to seize power.
This visibility inadvertently fuels emulation, especially among those less likely to ascend through lawful means, leading to a surge in illegitimate power grabs.
Henri Namphy's leadership in Haiti's 1988 coup stands as a typical example, swiftly followed by his own ousting through another coup.
As reflected in @tbl-coups, 15 countries have encountered at least 10 coups since 1950, with most surpassing 5 successful attempts [@powell2011].
Societal desensitization to coups might mitigate potential power challengers, particularly when incumbent leaders themselves ascended via similar unlawful routes.
Recent instances in Burkina Faso (2022) and Niger (2023) demonstrate this familiarity, where people openly rallied in support of coups, showcasing an alarming normalization.
In countries like Haiti and Burkina Faso, coups have become more frequent than constitutionally guided transitions of power.

Moreover, coups not only breed subsequent coups but also embolden external challengers, fostering uprisings, revolutions, and civil wars, as highlighted by @dahl2023.


::: {#tbl-coups .cell tbl-cap='Frequency of Coups by Country (1950–2023)'}
::: {.cell-output-display}
\setlength{\LTpost}{0mm}
\begin{longtable}{lrr}
\toprule
\textbf{Country} & \textbf{Coup\_attempts} & \textbf{Coup\_succeed} \\ 
\midrule\addlinespace[2.5pt]
Bolivia & 23 & 11 \\ 
Argentina & 20 & 7 \\ 
Sudan & 17 & 6 \\ 
Haiti & 13 & 9 \\ 
Venezuela & 13 & 0 \\ 
Iraq & 12 & 4 \\ 
Syria & 12 & 8 \\ 
Thailand & 12 & 8 \\ 
Ecuador & 11 & 5 \\ 
Burundi & 11 & 5 \\ 
Guatemala & 10 & 5 \\ 
Honduras & 10 & 6 \\ 
Burkina Faso & 10 & 9 \\ 
Sierra Leone & 10 & 5 \\ 
Ghana & 10 & 5 \\ 
\bottomrule
\end{longtable}
\begin{minipage}{\linewidth}
            \emph{Data Source: Powell \& Thyne (2011)}\\
\end{minipage}
:::
:::


it is undeniable that a few coups have been justified by resolving crises and leading to improved outcomes.
they remain illegal means to remove incumbents.

On the other hand, leaders who overstay their tenures may lack legitimacy but often manage to maintain power through a facade of legitimacy.
They don't blatantly seize power via military force but rather cling to power through parliamentary or congressional processes, the Supreme Court, and even nationwide referendums.
The opposition usually chooses to confront these leaders using legal means, engaging in legislative debates or legal proceedings, and sometimes by advocating for another referendum.
Attempts to overthrow leaders who overstay their terms through coups would be even less legitimate and might struggle to garner support.
However, removing such leaders within the boundaries of the law presents an arduous challenge, if not a near-impossible task.

### Uncertainty

As previously discussed, both leaders who assume power through coups and those who extend their terms contribute to uncertainties within their regimes.
However, regimes led by overstaying rulers generally demonstrate lesser overall uncertainty.

Primarily, following coups, regimes face uncertainty regarding four potential outcomes: democracies initially overthrown by coups may either persist as democracies (I) or transition into autocracies (II), while autocracies overthrown by coups may either endure as autocracies (III) or evolve into democracies (IV).
In contrast, regimes with leaders overstaying their terms, with only rare exceptions, typically persist as autocracies.

Secondly, the anticipated duration of future ruling tenures tends to be longer for overstaying rulers than for coup-entry leaders.
Most overstaying leaders endeavor to prolong their tenures for as long as possible.
For example, figures like Putin in Russia and Xi Jinping in China are less inclined to voluntarily step down unless forcibly removed from power.
Conversely, coup-entry leaders face greater uncertainty.
Coups are often justified through diverse excuses or claims.
Some assert their actions as defending democratic order, exemplified by President Manuel Zelaya's ousting in Honduras in 2009.
Others claim to protect the constitution, such as President Mamadou Tandja's overthrow in Niger in 2010.
The complexity arises when certain coup leaders honor their promises by transferring power to a constitutional successor.
For instance, following the 2010 coup in Niger, a new constitution restored civilian power and reinstated a strict two-term limit on the presidency in the same year [@ginsburg2019].
However, numerous others refuse to step down and retain power, as observed in the 1973 coup in Chile [@ökten2022].

Thirdly, uncertainties abound regarding policy changes and power reshuffling.
Comparatively, coup-entry leaders need to restructure top officials and justify their actions by implementing noticeable differences after overthrowing the incumbents.
In contrast, overstaying leaders face fewer issues as their regimes experience minimal dramatic changes.
There is no rush to dismantle the old ruling paradigm and establish a new order.

### Equilibrium of power

Rulers in autocracies face a challenging dilemma in managing powerful elites.
They require a strong force to counter potential external threats while constantly grappling with the fear of being replaced by competent and ambitious subordinates.
Therefore, maintaining a delicate balance of power becomes a sophisticated skill.
It's apparent that sustaining equilibrium is easier than restoring it once disrupted.

In regimes with leaders overstaying their terms, there exists, at least temporarily, a superficial equilibrium of power.
Successful overstays demonstrate the incumbents' firm grip on power, effectively deterring both internal dissent and external challenges.
Consequently, this contributes to the overall stability of the governing structure and society.

Conversely, leaders who come to power through coups invariably disrupt the balance of power and must establish a new equilibrium, even in relatively peaceful coup scenarios.
The overthrow of previous rulers necessitates the dismantling of the existing ruling framework and a reshuffling of top officers and officials.
These actions inevitably breed turbulence and adversaries for the new rulers, making the restoration of order and the balance of power considerably more challenging.

Internal conflicts among elites, as highlighted by numerous scholars, pose a significant threat to the stability of those in power.
Hence, they are often compelled to negotiate and compromise among external factions.
As noted by @roessler2011, these rulers might attempt to reduce the likelihood of subsequent coups, albeit at the expense of increasing the risk of societal rebellions and civil wars.
This strategy resonates with the approach adopted by Chinese leader Chiang Kai-shek in the 1930s.
He pursued a strategy of compromise with both Japan and the Soviet Union to eliminate the internal threat posed by the Chinese Communist Party, prioritizing "Domestic stability takes precedence over resisting foreign invasion" during that period [@chu1999chiang].
However, adopting a hardline stance internally could not only weaken themselves by purging elites, but also incite backlash from close allies, as witnessed in instances like Idi Amin's coup in 1971 in Uganda and Pervez Musharraf's coup in 1999 in Pakistan [@sudduth2017a].

These factors collectively contribute to a shorter expected lifespan of regimes following coups [@dahl2023], compared to relatively longer tenures for overstaying regimes.
Analyzing a comprehensive coup dataset [@powell2011] spanning from 1950 to 2023, it's evident that 97 countries experienced coups during this period.
Among them, 15 countries endured at least 10 coups, and 10 countries witnessed more than 6 successful coups, reinforcing the analysis discussed above.

Based on these insights, I propose the following hypothesis:

**Hypothesis:** Political leaders who successfully extend their time in power are more likely to have prolonged survival compared to leaders who assume power through coups.

In the upcoming section, I'll outline the research methodology employed in this paper.
The goal is to delve deeply into understanding the factors influencing the survival duration of incumbent overstaying leaders and coup-entry leaders.
This investigation aims to elucidate the extent to which these identified factors impact the survival durations of these distinct groups.

## Method and data

\newpage

## References