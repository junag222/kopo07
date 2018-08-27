package kr.co.uclick.service;

import static org.junit.Assert.assertEquals;

import java.util.Optional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.StopWatch;

import kr.co.uclick.configuration.SpringConfiguration;
import kr.co.uclick.entity.Member;
import kr.co.uclick.entity.Sample;
import kr.co.uclick.repository.MemberRepository;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class SampleServiceTest {

    @Autowired
    SampleService sampleService;
    
//    @Test
//    public void test() {
//        Optional<Member> m = memberRepository.findById(1L);
//        Member member = m.get();
//        
//        assertEquals(1,member.getId().longValue());
//    }

//    @Test
//    public void testDelete() {
//        Optional<Member> m = sampleService.findById(1L);
//        Member member = m.get();
//        
//        assertEquals(1,member.getId().longValue());
//    }
    
    
    @Test
    public void testSelectOne() {
        StopWatch sw = new StopWatch();
        sw.start();
        Sample s1 = sampleService.selectOne(1L);
        sw.stop();
        System.out.println("1 total time : " + sw.getTotalTimeSeconds());
        
        sw= new StopWatch();
        sw.start();
        Sample s2 = sampleService.selectOne(1L);
        sw.stop();
        System.out.println("2 total time : " + sw.getTotalTimeSeconds());
        
//        sw= new StopWatch();
//        sw.start();
        sampleService.updateOne(s1);
//        sw.stop();
//        System.out.println("3 total time : " + sw.getTotalTimeSeconds());
        
        sw= new StopWatch();
        sw.start();
        Sample s3 = sampleService.selectOne(1L);
        sw.stop();
        System.out.println("4 total time : " + sw.getTotalTimeSeconds());
        
        sw= new StopWatch();
        sw.start();
        Sample s4 = sampleService.selectOne(1L);
        sw.stop();
        System.out.println("5 total time : " + sw.getTotalTimeSeconds());

        
//        assertEquals(1,s1.getId().intValue());
    }
    
}