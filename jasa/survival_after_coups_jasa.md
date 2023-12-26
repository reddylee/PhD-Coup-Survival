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
|-------------------|-------------------------|----------------------------|
| Legitimacy                       | Normally attained through lawful procedures, but lacking recognized legitimacy.                                     | Attained unlawfully, devoid of legitimacy.                                                                                                                           |
| Uncertainty in Power Transitions | Initially stable; uncertainty grows with prolonged tenure, especially without designated successors as leaders age. | Significant uncertainty initially; stability emerges as power is consolidated, yet prolonged leadership poses similar challenges as overstay, fostering instability. |
| Power Sharing                    | Fewer challenges in power equilibrium due to successful overstay.                                                   | Confront power-sharing issues promised during coup staging, potentially triggering dissatisfaction among supporters if agreements are unmet.                         |

: Key Distinctions in Survival Tenures: Overstay versus Coup-Entry Leaders {#tbl-aspects .striped}

### Legitimacy

The core of a coup inherently lacks legitimacy, being deemed "illegal" due to its sudden and unconstitutional nature.
Successful coups serve as a catalyst, publicly spotlighting alternate, non-constitutional paths to seize power.
This visibility inadvertently encourages imitation, especially among those less inclined to ascend to power through lawful channels, leading to a surge in illegitimate power seizures.
Henri Namphy's leadership during Haiti's 1988 coup serves as an typical example, swiftly followed by his own removal through another coup.
Haiti's history records instances of multiple coups within a single year—such as 3 in 1957, and 2 each in 1988, 1989, and 1991—a narrative echoed in numerous other coup-prone nations.
Notable examples post-2000 include 2 coups in 2001 in Burundi, 2 in 2021 in Sudan, and 2 in 2022 in Burkina Faso [@powell2011].
As reflected in @tbl-coups, 15 countries have weathered at least 10 coups since 1950, with most exceeding 5 successful attempts [@powell2011].
These 15 nations collectively accounted for 40% of total coup attempts and 38% of successful coups.
In these frequent-coup countries, coups have even surpassed constitutionally guided power transitions in frequency.
Both ruling groups and the populace have grown accustomed to coups, perceiving them as an acceptable means of power transition.
Recent occurrences in Burkina Faso (2022) and Niger (2023) demonstrate this familiarity, where some individuals treated these events more akin to festive celebrations rather than coups.

Moreover, coups not only breed subsequent coups but also embolden external challengers, fostering uprisings, revolutions, and civil wars, as highlighted by @dahl2023.


::: {#tbl-coups .cell tbl-cap='Frequency of Coups by Country (1950–2023)'}
::: {.cell-output-display}
\begin{table}
\centering
\begin{tabular}{>{\raggedright\arraybackslash}p{4.5cm}>{\centering\arraybackslash}p{4.5cm}>{\raggedleft\arraybackslash}p{4.5cm}}
\toprule
\textbf{Country} & \textbf{Coup attempts} & \textbf{Successful coups}\\
\midrule
\cellcolor{gray!6}{Bolivia} & \cellcolor{gray!6}{23} & \cellcolor{gray!6}{11}\\
\addlinespace
Argentina & 20 & 7\\
\addlinespace
\cellcolor{gray!6}{Sudan} & \cellcolor{gray!6}{17} & \cellcolor{gray!6}{6}\\
\addlinespace
Haiti & 13 & 9\\
\addlinespace
\cellcolor{gray!6}{Venezuela} & \cellcolor{gray!6}{13} & \cellcolor{gray!6}{0}\\
\addlinespace
Iraq & 12 & 4\\
\addlinespace
\cellcolor{gray!6}{Syria} & \cellcolor{gray!6}{12} & \cellcolor{gray!6}{8}\\
\addlinespace
Thailand & 12 & 8\\
\addlinespace
\cellcolor{gray!6}{Ecuador} & \cellcolor{gray!6}{11} & \cellcolor{gray!6}{5}\\
\addlinespace
Burundi & 11 & 5\\
\addlinespace
\cellcolor{gray!6}{Guatemala} & \cellcolor{gray!6}{10} & \cellcolor{gray!6}{5}\\
\addlinespace
Honduras & 10 & 6\\
\addlinespace
\cellcolor{gray!6}{Burkina Faso} & \cellcolor{gray!6}{10} & \cellcolor{gray!6}{9}\\
\addlinespace
Sierra Leone & 10 & 5\\
\addlinespace
\cellcolor{gray!6}{Ghana} & \cellcolor{gray!6}{10} & \cellcolor{gray!6}{5}\\
\bottomrule
\multicolumn{3}{l}{\rule{0pt}{1em}\textit{Data source: Powell \& Thyne(2011)}}\\
\multicolumn{3}{l}{\rule{0pt}{1em}}\\
\end{tabular}
\end{table}
:::
:::


For leaders surpassing their designated terms, the situation diverges.
As incumbents, they abuse their power to manipulate the power transition dynamics.
They might reinterpret or amend the constitution, utilizing avenues like parliamentary votes, supreme court decisions, or referendums, with aspirations for prolonged or even lifelong tenure.
Yet fundamentally, most instances of overstaying lack authentic legitimacy as such leaders often exploit their authority, resorting at times to illegal measures like arresting, expelling, or even assassinating opposition figures[^2].
Consequently, these alterations in leadership tenure and power transitions do not genuinely reflect the populace's will.
Nonetheless, it's notable that, on the surface, the methods employed by overstay leaders carry a semblance of legitimacy compared to coups.
Even if contesting their legitimacy, challengers are normally constrained to adopt lawful means.

[^2]: <https://www.france24.com/en/live-news/20221123-vladimir-putin-s-critics-dead-jailed-exiled>: Vladimir Putin's critics: dead, jailed, exiled.
    Accessed on Dec 23, 2023.

Additionally, overstaying might attract imitators, yet replicating overstaying differs significantly from replicating coups.
While coups can happen at any moment, overstaying requires a prerequisite—those seeking to overstay must initially occupy leadership positions.
Even if challengers openly reject legitimacy and attempt to employ similarly illegitimate methods, such as orchestrating coups to oust overstay leaders, it presents a far greater challenge, as it demands considerable strength or substantial support.
Conversely, an overstay leader inherently possesses a position of advantage in terms of power.
For instance, in 2018, China's National People's Congress sanctioned the removal of the two-term limit on the presidency—only two delegates opposed the change, and three abstained out of 2,964 votes—effectively granting Xi Jinping the potential to remain in power for life[^3].
Similarly, in Russia's 2020 constitutional referendum, 79% of valid votes supported changes to the constitution enabling Putin to potentially rule until 2036[^4]
. While these figures may not accurately reflect genuine support from ruling groups or the populace, they do underscore the consolidation of power by the incumbents
.

[^3]: <https://www.bbc.co.uk/news/world-asia-china-43361276>: China's Xi allowed to remain 'president for life' as term limits removed.
    Accessed on Dec 23, 2023.

[^4]: <https://www.ucl.ac.uk/news/2020/jul/analysis-vladimir-putin-secures-constitutional-changes-allowing-him-rule-until-2036>: Analysis: Vladimir Putin secures constitutional changes allowing him to rule until 2036.
    Accessed on Dec 23, 2023.

Hence, from the legitimacy standpoint, while both overstaying leaders and coup-entry leaders lack genuine legitimacy, the former retain an edge in superficial legitimacy and are more powerful, potentially leading to longer-lasting regimes than those initiated by coup-entry leaders.

### Uncertainty

As discussed earlier, both leaders who overstay their terms and those who come to power through coups contribute to uncertainty within their regimes.
However, regimes led by overstay rulers generally exhibit comparatively lower levels of overall uncertainty.

In the aftermath of coups, uncertainty arises concerning the identity of the leader and the duration of their tenure.
The majority of coup leaders have retained power since their coups, such as Gamal Abdel Nasser in Egypt since the 1954 coup, Muammar Gaddafi in Libya following the 1969 coup, and Idi Amin in Uganda after the 1971 coup [@geddes2018].
Some coup leaders have claimed to intend to transfer power to constitutionally elected leaders but failed to honor their commitments, as seen in the case of the military junta in Myanmar after the 2021 coup.
Despite promising a new election after a year-long state of emergency, the military junta extended the emergency multiple times and retained power until the end of 2023[^5].
Moreover, within military juntas themselves, uncertainties persist.
For instance, following the Chilean Coup in 1973, a military junta initially planned to rotate the presidency among the commanders-in-chief of the four military branches.
However, General Pinochet consolidated his control and retained power in Chile until 1990 [@svolik2012].

[^5]: <https://thediplomat.com/2023/08/myanmar-junta-extends-state-of-emergency-for-fourth-time/>: Myanmar Junta Extends State of Emergency for Fourth Time.
    Accessed on Dec 24, 2023.

Notably, some coup leaders have honored their promises and restored power to constitutional civilian governments.
For instance, after the 2010 coup in Niger, a new constitution reinstated civilian rule and implemented a strict two-term limit on the presidency within the same year [@ginsburg2019].

In contrast, situations involving overstaying leaders offer more straightforward answers regarding who will rule and for how long.
Overstayed incumbents remain in power for extended periods, often aiming to prolong their tenures as much as possible.
For instance, leaders like Putin in Russia and Xi Jinping in China are less inclined to voluntarily relinquish power unless forcibly removed.
Even in cases like President Menem of Argentina, who successfully overstayed his term until 1993 but failed in his attempt for another term in 1999, his extended tenure still lasted for a full five-year term [@llanos2019].

Moreover, uncertainties not only revolve around who leads and for how long but also concerning the leadership style and governance approach.
Coup-entry leaders face the need to restructure top officials and substantiate their actions by implementing substantial changes after toppling incumbents.
In contrast, overstaying leaders encounter fewer obstacles, as their regimes experience fewer abrupt changes.
They are less pressured to dismantle the existing ruling paradigm and establish a new order.

Hence, comparatively, the rule of overstaying leaders tends to be less uncertain than that of coup-entry leaders, aiding overstaying leaders in stabilizing their governance and increasing their likelihood of enduring longer than coup-entry leaders.

### Equilibrium of power

Autocratic rulers often grapple with a predicament known as the "Guardianship dilemma" in maintaining their authority.
They find themselves in need of loyal subordinates while also requiring competent followers to manage intricate challenges and suppress opposition.
However, these capable supporters might eventually pose a threat to their rule [@wintrobe2012; @mcmahon2015; @geddes2018].
More often than not, heightened competence coincides with increased ambition.
Hence, the art of establishing and preserving a delicate power balance becomes an intricate skill.
Comparatively, leaders who come to power through coups face even more daunting challenges in navigating the perilous game of power equilibrium.
They must establish a stable power equilibrium initially, whereas entrenched leaders only need to maintain an existing balance.
Nonetheless, restoring a disrupted balance of power is significantly more challenging than sustaining an already established equilibrium.

Leaders who seize power through coups inevitably disrupt the existing balance of power, necessitating the establishment of a new equilibrium, even in seemingly peaceful scenarios.
The removal of previous rulers mandates the dismantling of the established governing structure and a reshuffling of high-ranking officers and officials.
These actions inherently sow unrest and create adversaries for the new leadership, making the restoration of order and the establishment of a balanced power structure notably challenging.
In order to establish consolidate power, coup-leaders often have to comprise to internal or external power challengers.
However, more often than not, these comprises are not stable and easy to break.
For instance, consider Jean-Bertrand Aristide, the president of Haiti, who was ousted in a 1991 coup and forced into exile.
Despite this, his supporters retained significant political influence, ultimately facilitating Aristide's return to power in 1994 [@bermeo2016].

Navigating internal power dynamics among coup leaders presents significant challenges.
For instance, after the Chilean coup in 1973, a fleeting balance prevailed among the four branches of the military junta.
However, this fragile equilibrium was short-lived as Pinochet consolidated absolute power in 1974 [@geddes2018].
However, taking an uncompromising stance within the leadership does not always proceed seamlessly, as seen in Pinochet's case.
Such actions may provoke backlash even from close allies.
In Uganda, President Obote's attempt to undermine the army commander-in-chief, Idi Amin, resulted in Amin garnering the support of the majority of the army and ultimately ousting Obote in a military coup in 1971.
Similarly, in Pakistan in 1999, shortly after Prime Minister Sharif dismissed powerful army chief General Pervez Musharraf, Sharif himself was ousted in a coup orchestrated by Musharraf and his military supporters [@sudduth2017].
The situation becomes even more intricate when there is a risk of civil war.
According to @roessler2011, leaders may endeavor to diminish the probability of subsequent coups, potentially increasing the likelihood of societal rebellions and civil wars.

The combination of these factors contributes to a shorter expected lifespan of coup-entry leaders [@dahl2023] compared to the relatively longer tenures of overstaying leaders.
As previously mentioned, the average survival period following an overstay is approximately five years longer than that of leaders entering power through coups (@fig-logrank).
Building upon these observations, I would like to propose the following hypothesis:

**Hypothesis:** Political leaders who successfully prolong their tenure in power are more likely to experience extended regime survival compared to leaders who come to power through coups.

In the subsequent section, I will outline the research methodology utilized in this paper.
I intend to introduce several control variables to determine if the hypothesis remains persistent and robust.

## Method and data

\newpage

## References
