package com.team2.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
@Component
public class PrintAdvice {
	
	 // Before - 타겟 동작 전 실행
	 // After - 타겟 동작 후 실행
	 // Around - 타겟 동작 전, 후 실행
//	@Before("execution(* test.spring.service.AopService*.*(..))")
//	public void printBefore(JoinPoint jp) {
//		System.out.println("====aop before====");
//		System.out.println(jp.getTarget());
//		System.out.println(jp.getArgs());
//		System.out.println(jp.getSignature());
//		System.out.println(jp.getKind());
//		System.out.println(jp.getThis());
//		System.out.println(jp.getSourceLocation());
//		System.out.println(jp.getStaticPart());
//		System.out.println("================");
//	}
//	@After("execution(* test.spring.service.AopService*.*(..))")
//	public void printAfter() {
//		System.out.println("aop After");
//	}
//	// 정상적으로 종료된 후 동작하는 advice
//	@AfterReturning("execution(* test.spring.service.AopService*.*(..))")
//	public void printAfterReturning() {
//		System.out.println("aop AfterReturning");
//	}
//	// 예외 발생시 동작하는 advice
//	@AfterThrowing("execution(* test.spring.service.AopService*.*(..))")
//	public void printAfterThrowing() {
//		System.out.println("aop AfterThrowing");
//	}
//	@Around("execution(* test.spring.service.AopService*.*(..))")
//	public Object printAround(ProceedingJoinPoint jp) throws Throwable {
//		System.out.println("aop Around-before");
//		Object obj = jp.proceed();
//		System.out.println("aop Around-after");
//		return obj;
//	}
//	@Around("execution(* test.spring.service.SampleService*.*(..))")
//	public Object printMVC(ProceedingJoinPoint jp) throws Throwable {
//		// 세션 확인
//		// RequestContextHolder = 웹정보 보관
//		// currentRequestAttributes = 현재 활성화된 리퀘스트 정보를 가져옴
//		RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
//		ServletRequestAttributes sa =(ServletRequestAttributes) ra;
//		HttpServletRequest request = sa.getRequest();
//		HttpSession session = request.getSession();
//		System.out.println("aop session check start");
//		Object obj = null;
//		// 세션이 null이면 서비스 실행 X
//		if(session.getAttribute("sid") != null) {
//			// 로그인 성공
//			obj = jp.proceed();
//		} 
//		System.out.println("aop session check end");
//		return obj;
//	}
}