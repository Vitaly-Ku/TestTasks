//
//  Question.swift
//  Millionaire
//
//  Created by Vit K on 20.07.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import Foundation

struct Question {
    
    let question: String
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String

    let rightAnswer: String
}

final class RoundFactory {
    static func makeRound() -> [Question] {
        let round1 = Question(question: "На каком инструменте, как считается, играл древнерусский певец и сказитель Боян?",
                              answer1: "На гуслях",
                              answer2: "На виолончели",
                              answer3: "На баяне",
                              answer4: "На гитаре",
                              rightAnswer: "На гуслях")
        let round2 = Question(question: "В какой из этих стран один из официальных языков - французский",
                              answer1: "Республика Гаити",
                              answer2: "Кения",
                              answer3: "Эквадор",
                              answer4: "Венесуэла",
                              rightAnswer: "Республика Гаити")
        let round3 = Question(question: "В каком из этих фильмов не снимался Александр Абдулов?",
                              answer1: "Карнавал",
                              answer2: "Московские каникулы",
                              answer3: "Чародеи",
                              answer4: "Убить дракона",
                              rightAnswer: "Московские каникулы")
        let round4 = Question(question: "В каком году произошла Куликовская битва?",
                              answer1: "1380",
                              answer2: "1569",
                              answer3: "1616",
                              answer4: "1773",
                              rightAnswer: "1380")
        let round5 = Question(question: "Кто автор музыки к детской песенке Чунга-Чанга?",
                              answer1: "Шаинский",
                              answer2: "Зацепин",
                              answer3: "Дербенёв",
                              answer4: "Шпиц",
                              rightAnswer: "Шаинский")
        let round6 = Question(question: "Какая картина Малевича находится в Русском музее?",
                              answer1: "Красный квадрат",
                              answer2: "Белый квадрат",
                              answer3: "Чёрный квадрат",
                              answer4: "Точильщик",
                              rightAnswer: "Красный квадрат")
        let round7 = Question(question: "Шкала Сковилла - это шкала оценки...",
                              answer1: "Качества атмосферного воздуха",
                              answer2: "Привлекательности женщин",
                              answer3: "Остроты перца",
                              answer4: "Уровня моря",
                              rightAnswer: "Остроты перца")
        let round8 = Question(question: "Какой титул имел Дон Кихот?",
                              answer1: "Барон",
                              answer2: "Маркиз",
                              answer3: "Идальго",
                              answer4: "Вождь",
                              rightAnswer: "Идальго")
        let round9 = Question(question: "Кто автор антиутопического романа 'О дивный новый мир'?",
                              answer1: "Олдос Хаксли",
                              answer2: "Рэй Брэдбери",
                              answer3: "Джордж Оруэлл",
                              answer4: "Сомерсет Моэм",
                              rightAnswer: "Олдос Хаксли")
        let round10 = Question(question: "Как называется самая глубокая точка поверхности Земли, находящаяся на дне Марианской впадины?",
                               answer1: "Филиппинская плита",
                               answer2: "Бездна Челленджера",
                               answer3: "Кермадек",
                               answer4: "Черное Логово",
                               rightAnswer: "Бездна Челленджера")
        return [round1, round2, round3, round4, round5, round6, round7, round8, round9, round10]
    }
}
